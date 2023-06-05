clear all
%% Path setup
dataDir = '../../data/raw/2023-04-05';

% all of these test cases were at 10k ERPM
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

fig = figure('Units','inches','Position',[2 2 8 3.5]);
tiledChartObj = tiledlayout(fig, 2, 2);

tiledChartObj.Padding = 'loose';
tiledChartObj.TileSpacing = 'compact';

SEC_TO_MS = 1e3;

rangeResolution = 0.75; %[m]
motorRange = 10; %[m]
motorRangeBin = floor(motorRange/rangeResolution);
rangeStart = motorRange - rangeResolution * (motorRangeBin - 1);
rangeEnd = rangeStart + rangeResolution * (height(onAxisOverlap.raw_data) - 1);
range = rangeStart:rangeResolution:rangeEnd;

% invert colormap so negative voltages correspond to positive colormap values
cmap = colormap();
colormap(flipud(cmap));

nexttile
imagesc(onAxisOverlap.time * SEC_TO_MS, range(1:30), onAxisOverlap.data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(a)', 'Units', 'normalized', 'Position',[0 1.03 0], 'FontSize', 11)
xticks([])


nexttile
imagesc(onAxisProp.time * SEC_TO_MS, range(1:30), onAxisProp.data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(b)', 'Units', 'normalized', 'Position',[0 1.03 0], 'FontSize', 11)
xticks([])


nexttile
imagesc(perpendicularOverlap.time * SEC_TO_MS, range(1:30), perpendicularOverlap.data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(c)', 'Units', 'normalized', 'Position',[0 1.03 0], 'FontSize', 11)


nexttile
imagesc(perpendicularProp.time * SEC_TO_MS, range(1:30), perpendicularProp.data(1:30,:));
xlim([0 150])
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman')
title('(d)', 'Units', 'normalized', 'Position',[0 1.03 0], 'FontSize', 11)

cbar = colorbar;
cbar.Layout.Tile = 'east';
cbar.YDir = 'reverse';
cbar.Label.String = 'PMT voltage (V)';
cbar.Label.FontSize = 11;
cbar.Label.FontName = 'Times New Roman';
cbar.FontSize = 10;
cbar.FontName = 'Times New Roman';

tiledChartObj.XLabel.String = 'time (ms)';
tiledChartObj.YLabel.String = 'distance (m)';

tiledChartObj.XLabel.FontName = 'Times New Roman';
tiledChartObj.XLabel.FontSize = 11;
tiledChartObj.YLabel.FontName = 'Times New Roman';
tiledChartObj.YLabel.FontSize = 11;

%% Save figure
exportgraphics(fig,'example-images.pdf', 'ContentType','vector')
