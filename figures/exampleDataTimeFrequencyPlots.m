clear all
%% Path setup
dataDir = '../../data/raw/2023-04-05';

onAxisOverlapPath = [dataDir filesep 'norm360-drone-prop-distance-test150121'];
onAxisPropPath = [dataDir filesep 'norm360-drone-prop-distance-test144801'];
perpendicularPropPath = [dataDir filesep 'norm360-drone-prop-distance-test140719'];
perpendicularOverlapPath = [dataDir  filesep 'norm360-drone-prop-distance-test143511'];

filename = 'adjusted_data_junecal_volts.mat';

%% Load data
load([onAxisOverlapPath filesep filename]);
onAxisOverlap = adjusted_data_junecal(21);

load([onAxisPropPath filesep filename]);
onAxisProp = adjusted_data_junecal(21);

load([perpendicularPropPath filesep filename]);
perpendicularProp = adjusted_data_junecal(21);

load([perpendicularOverlapPath filesep filename]);
perpendicularOverlap = adjusted_data_junecal(21);

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
motorRangeBin = 13;

figure('Visible','off')
% figure('Visible','on')
tlayout1 = tiledlayout(2,1);

tlayout1.Padding = 'tight';
tlayout1.TileSpacing = 'tight';

tlayout1.Parent = tiledChartObj;
tlayout1.Layout.Tile = 1;

ax1 = axes(tlayout1);
ax1.Layout.Tile = 1;
plot(ax1, onAxisOverlap.time * SEC_TO_MS, onAxisOverlap.data(motorRangeBin,:), 'LineWidth', 1);


ax2 = axes(tlayout1);
ax2.Layout.Tile = 2;

fs = 1/mean(diff(onAxisOverlap.time));
f = linspace(0, fs/2, 512);

onAxisOverlapSpectrum = (abs(fft(onAxisOverlap.data(motorRangeBin,:))));
onAxisOverlapSpectrum = onAxisOverlapSpectrum/onAxisOverlapSpectrum(1);
plot(ax2, f, db(onAxisOverlapSpectrum(1:end/2)), 'LineWidth', 1.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% on-axis prop plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 13;

figure('Visible','off')
% figure('Visible','on')

tlayout2 = tiledlayout(2,1);

tlayout2.Padding = 'tight';
tlayout2.TileSpacing = 'tight';

tlayout2.Parent = tiledChartObj;
tlayout2.Layout.Tile = 2;

ax3 = axes(tlayout2);
ax3.Layout.Tile = 1;
plot(ax3, onAxisProp.time * SEC_TO_MS, onAxisProp.data(motorRangeBin,:), 'LineWidth', 1);

ax4 = axes(tlayout2);
ax4.Layout.Tile = 2;

fs = 1/mean(diff(onAxisProp.time));
f = linspace(0, fs/2, 512);

onAxisPropSpectrum = (abs(fft(onAxisProp.data(motorRangeBin,:))));
onAxisPropSpectrum = onAxisPropSpectrum/onAxisPropSpectrum(1);
plot(ax4, f, db(onAxisPropSpectrum(1:end/2)), 'LineWidth', 1.5);




%%%%%%%%%%%%%%%%%%%%%%%%%%%
% perpendicular overlap plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 12;

figure('Visible','off')
% figure('Visible','on')

tlayout4 = tiledlayout(2,1);

tlayout4.Padding = 'tight';
tlayout4.TileSpacing = 'tight';

tlayout4.Parent = tiledChartObj;
tlayout4.Layout.Tile = 3;

ax7 = axes(tlayout4);
ax7.Layout.Tile = 1;
plot(ax7, perpendicularOverlap.time * SEC_TO_MS, perpendicularOverlap.data(motorRangeBin,:), 'LineWidth', 1);

ax8 = axes(tlayout4);
ax8.Layout.Tile = 2;

fs = 1/mean(diff(perpendicularOverlap.time));
f = linspace(0, fs/2, 512);

avg = mean(perpendicularOverlap.data(motorRangeBin,:));
perpendicularOverlapSpectrum = (abs(fft(perpendicularOverlap.data(motorRangeBin,:))));
perpendicularOverlapSpectrum = perpendicularOverlapSpectrum/perpendicularOverlapSpectrum(1);
plot(ax8, f, db(perpendicularOverlapSpectrum(1:end/2)), 'LineWidth', 1.5);
% scatter(ax8, f, db(perpendicularOverlapSpectrum(1:end/2)), 10,'filled');


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% perpendicular prop plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 13;

figure('Visible','off')
% figure('Visible','on')

tlayout3 = tiledlayout(2,1);

tlayout3.Padding = 'tight';
tlayout3.TileSpacing = 'tight';

tlayout3.Parent = tiledChartObj;
tlayout3.Layout.Tile = 4;

ax5 = axes(tlayout3);
ax5.Layout.Tile = 1;
plot(ax5, perpendicularProp.time * SEC_TO_MS, perpendicularProp.data(motorRangeBin,:), 'LineWidth', 1);

ax6 = axes(tlayout3);
ax6.Layout.Tile = 2;

fs = 1/mean(diff(perpendicularProp.time));
f = linspace(0, fs/2, 512);

perpendicularPropSpectrum = (abs(fft(perpendicularProp.data(motorRangeBin,:))));
perpendicularPropSpectrum = perpendicularPropSpectrum/perpendicularPropSpectrum(1);
plot(ax6, f, db(perpendicularPropSpectrum(1:end/2)), 'LineWidth', 1.5);


% Set x- and y-axis labels
for i = 1:4
    tiledChartObj.Children(i).Children(2).XLabel.String = 'time (ms)';
    tiledChartObj.Children(i).Children(1).XLabel.String = 'frequency (Hz)';
    tiledChartObj.Children(i).Children(2).YLabel.String = sprintf('voltage\n(V)');
    tiledChartObj.Children(i).Children(1).YLabel.String = sprintf('magnitude\n(dB)');

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
ax7.XLim = [0 max(perpendicularOverlap.time * SEC_TO_MS)];
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
ax2.YLim = [-70 5];
ax4.YLim = [-70 5];
ax6.YLim = [-70 5];
ax8.YLim = [-70 5];

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
ax5.Title.String = '(d)';
ax5.Title.Position = [0 0.15 0];
ax5.Title.FontSize = 11;
ax7.Title.String = '(c)';
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
