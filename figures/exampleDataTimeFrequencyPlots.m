clear all
%% Path setup
dataDir = '../../data/raw/2022-12-16';

% all of these test cases were at 1,428.45 RPM (71.42 Hz)
onAxisOverlapPath = [dataDir filesep 'drone-prop-test115825'];
onAxisPropPath = [dataDir filesep 'drone-prop-test103404'];
perpendicularPropPath = [dataDir filesep 'drone-prop-test111351'];
perpendicularMotorBodyPath = [dataDir  filesep 'drone-prop-test112945'];

filename = 'adjusted_data_junecal_volts.mat';

%% Load data
load([onAxisOverlapPath filesep filename]);
onAxisOverlap = adjusted_data_junecal(1);

load([onAxisPropPath filesep filename]);
onAxisProp = adjusted_data_junecal(1);

load([perpendicularPropPath filesep filename]);
perpendicularProp = adjusted_data_junecal(1);

load([perpendicularMotorBodyPath filesep filename]);
perpendicularMotorBody = adjusted_data_junecal(1);

clear adjusted_data_junecal

%% Plots
close all

set(groot,'defaultAxesFontName','Times New Roman');
set(groot,'defaultAxesFontSize',11);

% parent tiledlayout chart
fig = figure('Units','inches','Position',[2 2 8 4]);
tiledChartObj = tiledlayout(fig, 2, 2);

tiledChartObj.Padding = 'loose';
tiledChartObj.TileSpacing = 'loose';

SEC_TO_MS = 1e3;


% invert colormap so negative voltages correspond to positive colormap values
cmap = colormap();
colormap(flipud(cmap));


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% on-axis overlap plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 4;

figure('Visible','off')
% figure('Visible','on')
tlayout1 = tiledlayout(2,1);

tlayout1.Padding = 'tight';
tlayout1.TileSpacing = 'tight';

tlayout1.Parent = tiledChartObj;
tlayout1.Layout.Tile = 1;

ax1 = axes(tlayout1);
ax1.Layout.Tile = 1;
plot(ax1, onAxisOverlap.time * SEC_TO_MS, onAxisOverlap.data(motorRangeBin,:), 'LineWidth', 1.5);


ax2 = axes(tlayout1);
ax2.Layout.Tile = 2;

fs = 1/mean(diff(onAxisOverlap.time));
f = linspace(0, fs/2, 512);

onAxisOverlapSpectrum = db(abs(fft(onAxisOverlap.data(motorRangeBin,:))));
plot(ax2, f, onAxisOverlapSpectrum(1:end/2), 'LineWidth', 1.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% on-axis prop plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 3;

figure('Visible','off')
% figure('Visible','on')

tlayout2 = tiledlayout(2,1);

tlayout2.Padding = 'tight';
tlayout2.TileSpacing = 'tight';

tlayout2.Parent = tiledChartObj;
tlayout2.Layout.Tile = 2;

ax3 = axes(tlayout2);
ax3.Layout.Tile = 1;
plot(ax3, onAxisProp.time * SEC_TO_MS, onAxisProp.data(motorRangeBin,:), 'LineWidth', 1.5);

ax4 = axes(tlayout2);
ax4.Layout.Tile = 2;

fs = 1/mean(diff(onAxisProp.time));
f = linspace(0, fs/2, 512);

onAxisPropSpectrum = db(abs(fft(onAxisProp.data(motorRangeBin,:))));
plot(ax4, f, onAxisPropSpectrum(1:end/2), 'LineWidth', 1.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% perpendicular prop plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 4;

figure('Visible','off')
% figure('Visible','on')

tlayout3 = tiledlayout(2,1);

tlayout3.Padding = 'tight';
tlayout3.TileSpacing = 'tight';

tlayout3.Parent = tiledChartObj;
tlayout3.Layout.Tile = 3;

ax5 = axes(tlayout3);
ax5.Layout.Tile = 1;
plot(ax5, perpendicularProp.time * SEC_TO_MS, perpendicularProp.data(motorRangeBin,:), 'LineWidth', 1.5);

ax6 = axes(tlayout3);
ax6.Layout.Tile = 2;

fs = 1/mean(diff(perpendicularProp.time));
f = linspace(0, fs/2, 512);

perpendicularPropSpectrum = db(abs(fft(perpendicularProp.data(motorRangeBin,:))));
plot(ax6, f, perpendicularPropSpectrum(1:end/2), 'LineWidth', 1.5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% perpendicular motor body plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 4;

figure('Visible','off')
% figure('Visible','on')

tlayout4 = tiledlayout(2,1);

tlayout4.Padding = 'tight';
tlayout4.TileSpacing = 'tight';

tlayout4.Parent = tiledChartObj;
tlayout4.Layout.Tile = 4;

ax7 = axes(tlayout4);
ax7.Layout.Tile = 1;
plot(ax7, perpendicularMotorBody.time * SEC_TO_MS, perpendicularMotorBody.data(motorRangeBin,:), 'LineWidth', 1.5);

ax8 = axes(tlayout4);
ax8.Layout.Tile = 2;

fs = 1/mean(diff(perpendicularMotorBody.time));
f = linspace(0, fs/2, 512);

avg = mean(perpendicularMotorBody.data(motorRangeBin,:));
perpendicularMotorBodySpectrum = db(abs(fft(perpendicularMotorBody.data(motorRangeBin,:))));
plot(ax8, f, perpendicularMotorBodySpectrum(1:end/2), 'LineWidth', 1.5);



% Set x- and y-axis labels
for i = 1:4
    tiledChartObj.Children(i).Children(2).XLabel.String = 'time (ms)';
    tiledChartObj.Children(i).Children(1).XLabel.String = 'frequency (Hz)';
    tiledChartObj.Children(i).Children(2).YLabel.String = sprintf('voltage\n(V)');
    tiledChartObj.Children(i).Children(1).YLabel.String = sprintf('magnitude\n(dBV)');

    tiledChartObj.Children(i).Children(1).YLabel.Units = 'normalized';
    tiledChartObj.Children(i).Children(2).YLabel.Units = 'normalized';   

    tiledChartObj.Children(i).Children(1).XLabel.FontSize = 11;
    tiledChartObj.Children(i).Children(2).XLabel.FontSize = 11;
    tiledChartObj.Children(i).Children(1).YLabel.FontSize = 11;
    tiledChartObj.Children(i).Children(2).YLabel.FontSize = 11;

end


% Set time-domain x-axis limits
ax1.XLim = [0 max(onAxisOverlap.time * SEC_TO_MS)];
ax3.XLim = [0 max(onAxisProp.time * SEC_TO_MS)];
ax5.XLim = [0 max(perpendicularProp.time * SEC_TO_MS)];
ax7.XLim = [0 max(perpendicularMotorBody.time * SEC_TO_MS)];
ax1.XTick = [0 50 100 150 200 floor(ax1.XLim(2))];
ax3.XTick = [0 50 100 150 200 floor(ax3.XLim(2))];
ax5.XTick = [0 50 100 150 200 floor(ax5.XLim(2))];
ax7.XTick = [0 50 100 150 200 floor(ax7.XLim(2))];

% Set time-domain y-axis limits
ax1.YLim = [-0.6 0.05];
ax3.YLim = [-0.6 0.05];
ax5.YLim = [-0.6 0.05];
ax7.YLim = [-0.6 0.05];

% Set freq.-domain x-axis limits
ax2.XLim = [0 250];
ax4.XLim = [0 250];
ax6.XLim = [0 250];
ax8.XLim = [0 250];

% Set freq.-domain y-axis limits
ax2.YLim = [-20 45];
ax4.YLim = [-20 45];
ax6.YLim = [-20 45];
ax8.YLim = [-20 45];

% line up y-labels
pos1 = tiledChartObj.Children(1).Children(1).YLabel.Position(1);
pos2 = tiledChartObj.Children(1).Children(2).YLabel.Position(1);
pos3 = tiledChartObj.Children(3).Children(1).YLabel.Position(1);
pos4 = tiledChartObj.Children(3).Children(2).YLabel.Position(1);

minPos = min([pos1,pos2,pos3,pos4]) - 0.03;

tiledChartObj.Children(1).Children(1).YLabel.Position(1) = minPos;
tiledChartObj.Children(1).Children(2).YLabel.Position(1) = minPos; 
tiledChartObj.Children(3).Children(1).YLabel.Position(1) = minPos;
tiledChartObj.Children(3).Children(2).YLabel.Position(1) = minPos; 

pos1 = tiledChartObj.Children(2).Children(1).YLabel.Position(1);
pos2 = tiledChartObj.Children(2).Children(2).YLabel.Position(1);
pos3 = tiledChartObj.Children(4).Children(1).YLabel.Position(1);
pos4 = tiledChartObj.Children(4).Children(2).YLabel.Position(1);

minPos = min([pos1,pos2,pos3,pos4]) - 0.03;

tiledChartObj.Children(2).Children(1).YLabel.Position(1) = minPos;
tiledChartObj.Children(2).Children(2).YLabel.Position(1) = minPos; 
tiledChartObj.Children(4).Children(1).YLabel.Position(1) = minPos;
tiledChartObj.Children(4).Children(2).YLabel.Position(1) = minPos;


% add subfigure "titles"
ax1.Title.String = '(a)';
ax1.Title.Position = [0 0.15 0];
ax1.Title.FontSize = 11;
ax3.Title.String = '(b)';
ax3.Title.Position = [0 0.15 0];
ax3.Title.FontSize = 11;
ax5.Title.String = '(c)';
ax5.Title.Position = [0 0.15 0];
ax5.Title.FontSize = 11;
ax7.Title.String = '(d)';
ax7.Title.Position = [0 0.15 0];
ax7.Title.FontSize = 11;

ax1.FontSize = 10;
ax2.FontSize = 10;
ax3.FontSize = 10;
ax4.FontSize = 10;
ax5.FontSize = 10;
ax6.FontSize = 10;
ax7.FontSize = 10;
ax8.FontSize = 10;


%% Save figure
exportgraphics(fig,'example-time-frequency.pdf', 'ContentType','vector')
