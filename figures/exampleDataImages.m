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
perpendciularProp = adjusted_data_junecal(1);

load([perpendicularMotorBodyPath filesep filename]);
perpendicularMotorBody = adjusted_data_junecal(1);

clear adjusted_data_junecal

%% Plots
close all

fig = figure('Units','inches','Position',[2 2 8 3.5]);
tiledChartObj = tiledlayout(fig, 2, 2);

SEC_TO_MS = 1e3;

rangeResolution = 0.75; %[m]
motorRange = 2.7; %[m]
motorRangeBin = 3; %[m]
rangeStart = motorRange - rangeResolution * (motorRangeBin - 1);
rangeEnd = rangeStart + rangeResolution * (height(onAxisOverlap.raw_data) - 1);
range = rangeStart:rangeResolution:rangeEnd;

% invert colormap so negative voltages correspond to positive colormap values
cmap = colormap();
colormap(flipud(cmap));

nexttile
imagesc(onAxisOverlap.time * SEC_TO_MS, range(1:30), onAxisOverlap.raw_data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(a)','Position',[-5.5 3], 'FontSize', 11)


nexttile
imagesc(onAxisProp.time * SEC_TO_MS, range(1:30), onAxisProp.raw_data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(b)','Position',[-6 3], 'FontSize', 11)


nexttile
imagesc(perpendciularProp.time * SEC_TO_MS, range(1:30), perpendciularProp.raw_data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(c)','Position',[-5.5 3], 'FontSize', 11)


nexttile
imagesc(perpendicularMotorBody.time * SEC_TO_MS, range(1:30), perpendicularMotorBody.raw_data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(d)','Position',[-6 3], 'FontSize', 11)


cbar = colorbar;
cbar.Layout.Tile = 'east';
cbar.YDir = 'reverse';
cbar.Label.String = 'PMT current (arb.)';
cbar.Label.FontSize = 11;
cbar.Label.FontName = 'Times New Roman';
cbar.FontSize = 10;
cbar.FontName = 'Times New Roman';

tiledChartObj.XLabel.String = 'time (ms)';
tiledChartObj.YLabel.String = 'distance (m)';
tiledChartObj.Padding = 'loose';
tiledChartObj.TileSpacing = 'compact';
tiledChartObj.XLabel.FontName = 'Times New Roman';
tiledChartObj.XLabel.FontSize = 11;
tiledChartObj.YLabel.FontName = 'Times New Roman';
tiledChartObj.YLabel.FontSize = 11;

%% Save figure
exportgraphics(fig,'example-images.pdf', 'ContentType','vector')
