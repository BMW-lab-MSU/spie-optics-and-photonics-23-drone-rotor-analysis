clear all
%% Path setup
dataDir = '../../data/raw/2022-12-16';

% all of these test cases were at 1,428.45 RPM (71.42 Hz)
perpendicularMotorBodyPath = [dataDir  filesep 'drone-prop-test112945'];

filename = 'adjusted_data_junecal_volts.mat';

%% Load data
load([perpendicularMotorBodyPath filesep filename]);
perpendicularMotorBody = adjusted_data_junecal(1);

clear adjusted_data_junecal

%% Plots
close all

set(groot,'defaultAxesFontName','Times New Roman');
set(groot,'defaultAxesFontSize',11);

% parent tiledlayout chart
fig = figure('Units','inches','Position',[2 2 4 4]);
tiledChartObj = tiledlayout(fig, 2, 1);

% tiledChartObj.Padding = 'compact';
tiledChartObj.TileSpacing = 'tight';

SEC_TO_MS = 1e3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% perpendicular motor body plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%
motorRangeBin = 4;
hardTargetRangeBin = 10;

nexttile
plot(perpendicularMotorBody.time * SEC_TO_MS, perpendicularMotorBody.data(hardTargetRangeBin,:),...
    'LineWidth', 1.5);
ylim([-0.6 0])
xlim([0 max(perpendicularMotorBody.time * SEC_TO_MS)])
xlabel('time (ms)', 'FontName', 'Times New Roman', 'FontSize', 10)
ylabel('voltage (V)', 'FontName', 'Times New Roman', 'FontSize', 10)
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')


fs = 1/mean(diff(perpendicularMotorBody.time));
f = linspace(0, fs/2, 512);

nexttile
hardTargetSpectrum = (abs(fft(perpendicularMotorBody.data(hardTargetRangeBin,:))));
hardTargetSpectrum = hardTargetSpectrum / hardTargetSpectrum(1);
plot(f, db(hardTargetSpectrum(1:end/2)), 'LineWidth', 1.5);
xlim([0 250])
ylim([-70 0])
xlabel('frequency (Hz)', 'FontName', 'Times New Roman', 'FontSize', 10)
ylabel('magnitude (dB)', 'FontName', 'Times New Roman', 'FontSize', 10)
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')

annotation(fig, 'textarrow',[0.5 0.355], [0.34, 0.34], 'String', '71.9 Hz')

% line up y-labels
tiledChartObj.Children(1).YLabel.Units = 'normalized';
tiledChartObj.Children(2).YLabel.Units = 'normalized';
pos1 = tiledChartObj.Children(1).YLabel.Position(1);
pos2 = tiledChartObj.Children(2).YLabel.Position(1);

minPos = min([pos1,pos2]);

tiledChartObj.Children(1).YLabel.Position(1) = minPos;
tiledChartObj.Children(2).YLabel.Position(1) = minPos;

%% Save figure
exportgraphics(fig,'hard-target-example.pdf', 'ContentType','vector')
