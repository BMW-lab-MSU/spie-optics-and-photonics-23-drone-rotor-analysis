%% Confusion matrices
% coarse tree trained to determine orientation on 60% speed data, tested on
% 40% speed data
orientation60SpeedCoarseTree = [
    5632, 0, 0;
    0, 384, 0;
    0, 0, 384
];

% wide neural network trained to determine orientation on 40% speed data,
% tested on 60% speed data
orientation40SpeedWideNet = [
    8442, 0, 6;
    23, 528, 25;
    8, 1, 568
];

% bagged trees trained to determine beam position on perpendicular data,
% tested on parallel data
beamPositionPerpBaggedTrees = [
    7040, 0, 0;
    160, 320, 0;
    0, 160, 320
];

% cubic nearest neighbor trained to determine beam position on parallel
% data, tested on perpendicular data
beamPositionParallelCubicKNN = [
    6676, 358, 6;
    3, 477, 0;
    0, 0, 480
];

% narrow neural network trained to determine orientation on propeller
% data, tested on overlap data
orientationPropNarrowNet = [
    6628, 125, 287;
    0, 0, 480;
    1, 0, 479
];

% wide neural network trained to determine orientation on overlap data,
% tested on propeller data
orientationOverlapWideNet = [
    7040, 0, 0;
    153, 95, 232;
    160, 0, 320
];

% wide neural network trained to determine position on 40% speed data,
% tested on 60% speed data
beamPosition40SpeedWideNet = [
    8442, 0, 6;
    23, 528, 25;
    8, 1, 567
];

% trilayer neural network trained to determine position on 60% speed data,
% tested on 40% speed data
beamPosition60SpeedTrilayerNet = [
    5632, 0, 0;
    0, 384, 0;
    0, 0, 384
];


%% Class labels

beamPositionLabels = ["Nothing", "Propeller", "Overlap"];
orientationlabels = ["Nothing", "Perpendicular", "Parallel"];

%% Create confusion matrix figure
close all;

% create figure object
fig = figure('Units','inches', 'Position',[2, 2, 7, 3.5]);
tLayout = tiledlayout(2,4);

% set tiled layout options
tLayout.Padding = "compact";
tLayout.TileSpacing = "loose";

% orientation 60% speed confusion chart
nexttile
confChartOrientation60Speed = confusionchart(orientation60SpeedCoarseTree, orientationlabels);
confChartOrientation60Speed.FontName = "Times New Roman";
confChartOrientation60Speed.FontSize = 10;
confChartOrientation60Speed.XLabel = "";
confChartOrientation60Speed.YLabel = "";
title('(a)');


% orientation 40% speed confusion chart
nexttile
confChartOrientation40Speed = confusionchart(orientation40SpeedWideNet, orientationlabels);
confChartOrientation40Speed.FontName = "Times New Roman";
confChartOrientation40Speed.FontSize = 10;
confChartOrientation40Speed.XLabel = "";
confChartOrientation40Speed.YLabel = "";
title('(b)');

% orientation propeller confusion chart
nexttile
confChartOrientationProp = confusionchart(orientationPropNarrowNet, orientationlabels);
confChartOrientationProp.FontName = "Times New Roman";
confChartOrientationProp.FontSize = 10;
confChartOrientationProp.XLabel = "";
confChartOrientationProp.YLabel = "";
title('(c)');

% orientation propeller/motor overlap confusion chart
nexttile
confChartOrientationOverlap = confusionchart(orientationOverlapWideNet, orientationlabels);
confChartOrientationOverlap.FontName = "Times New Roman";
confChartOrientationOverlap.FontSize = 10;
confChartOrientationOverlap.XLabel = "";
confChartOrientationOverlap.YLabel = "";
title('(d)');

% beam position 60% speed confusion chart
nexttile
confChartBeamPosition60Speed = confusionchart(beamPosition60SpeedTrilayerNet, beamPositionLabels);
confChartBeamPosition60Speed.FontName = "Times New Roman";
confChartBeamPosition60Speed.FontSize = 10;
confChartBeamPosition60Speed.XLabel = "";
confChartBeamPosition60Speed.YLabel = "";
title('(e)');

% beam position 40% speed confusion chart
nexttile
confChartBeamPosition40Speed = confusionchart(beamPosition40SpeedWideNet, beamPositionLabels);
confChartBeamPosition40Speed.FontName = "Times New Roman";
confChartBeamPosition40Speed.FontSize = 10;
confChartBeamPosition40Speed.XLabel = "";
confChartBeamPosition40Speed.YLabel = "";
title('(f)');

% beam position perpendicular confusion chart
nexttile
confCharBeamPositionPerp = confusionchart(beamPositionPerpBaggedTrees, beamPositionLabels);
confCharBeamPositionPerp.FontName = "Times New Roman";
confCharBeamPositionPerp.FontSize = 10;
confCharBeamPositionPerp.XLabel = "";
confCharBeamPositionPerp.YLabel = "";
title('(g)');

% beam position parallel confusion chart
nexttile
confChartBeamPositionParallel = confusionchart(beamPositionParallelCubicKNN, beamPositionLabels);
confChartBeamPositionParallel.FontName = "Times New Roman";
confChartBeamPositionParallel.FontSize = 10;
confChartBeamPositionParallel.XLabel = "";
confChartBeamPositionParallel.YLabel = "";
title('(h)');


% axis labels
tLayout.XLabel.String = "Predicted Class";
tLayout.XLabel.FontSize = 10;
tLayout.XLabel.FontName = "Times New Roman";

tLayout.YLabel.String = "True Class";
tLayout.YLabel.FontSize = 10;
tLayout.YLabel.FontName = "Times New Roman";

%% Save figure
exportgraphics(fig, 'confusion-matrix-results.pdf', 'ContentType', 'vector')