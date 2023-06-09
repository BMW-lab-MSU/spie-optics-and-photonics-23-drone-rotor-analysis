%% Confusion matrices
% wide neural network trained to determine orientation on 60% speed data, tested on
% 40% speed data
orientation60Speed = [
    5628, 4, 0;
    1, 383, 0;
    2, 1, 381
];

% wide neural network trained to determine orientation on 40% speed data,
% tested on 60% speed data
orientation40Speed = [
    8447, 6, 0;
    8, 567, 1;
    23, 25, 528
];

% wide neural network trained to determine beam position on perpendicular data,
% tested on parallel data
beamPositionPerp = [
    7040, 0, 0;
    161, 307, 12;
    402, 0, 78
];

% wide neural network trained to determine beam position on parallel
% data, tested on perpendicular data
beamPositionParallel = [
    6387, 1, 652;
    0, 480, 0;
    3, 0, 480
];

% wide neural network trained to determine orientation on propeller
% data, tested on overlap data
orientationProp = [
    6826, 214, 0;
    0, 480, 0;
    0, 480, 0
];

% wide neural network trained to determine orientation on overlap data,
% tested on propeller data
orientationOverlap = [
    7040, 0, 0;
    160, 320, 0;
    152, 232, 95
];

% wide neural network trained to determine position on 40% speed data,
% tested on 60% speed data
beamPosition40Speed = [
    8441, 2, 5;
    6, 566, 4;
    71, 0, 505
];

% wide neural network trained to determine position on 60% speed data,
% tested on 40% speed data
beamPosition60Speed = [
    5628, 4, 0;
    1, 383, 0;
    2, 1, 381
];


%% Class labels

beamPositionLabels = ["Nothing", "Overlap", "Propeller"];
orientationlabels = ["Nothing", "Parallel", "Perpendicular"];

%% Create confusion matrix figure
close all

% create figure object
fig = figure('Units','inches', 'Position',[2, 2, 7, 3.5]);
tLayout = tiledlayout(2,4);

% set tiled layout options
tLayout.Padding = "compact";
tLayout.TileSpacing = "compact";

% orientation 60% speed confusion chart
nexttile
confChartOrientation60Speed = confusionchart(orientation60Speed, orientationlabels);
confChartOrientation60Speed.FontName = "Times New Roman";
confChartOrientation60Speed.FontSize = 10;
confChartOrientation60Speed.XLabel = "";
confChartOrientation60Speed.YLabel = "";
title('(a)');


% orientation 40% speed confusion chart
nexttile
confChartOrientation40Speed = confusionchart(orientation40Speed, orientationlabels);
confChartOrientation40Speed.FontName = "Times New Roman";
confChartOrientation40Speed.FontSize = 10;
confChartOrientation40Speed.XLabel = "";
confChartOrientation40Speed.YLabel = "";
title('(b)');

% orientation propeller confusion chart
nexttile
confChartOrientationProp = confusionchart(orientationProp, orientationlabels);
confChartOrientationProp.FontName = "Times New Roman";
confChartOrientationProp.FontSize = 10;
confChartOrientationProp.XLabel = "";
confChartOrientationProp.YLabel = "";
title('(c)');

% orientation propeller/motor overlap confusion chart
nexttile
confChartOrientationOverlap = confusionchart(orientationOverlap, orientationlabels);
confChartOrientationOverlap.FontName = "Times New Roman";
confChartOrientationOverlap.FontSize = 10;
confChartOrientationOverlap.XLabel = "";
confChartOrientationOverlap.YLabel = "";
title('(d)');

% beam position 60% speed confusion chart
nexttile
confChartBeamPosition60Speed = confusionchart(beamPosition60Speed, beamPositionLabels);
confChartBeamPosition60Speed.FontName = "Times New Roman";
confChartBeamPosition60Speed.FontSize = 10;
confChartBeamPosition60Speed.XLabel = "";
confChartBeamPosition60Speed.YLabel = "";
title('(e)');

% beam position 40% speed confusion chart
nexttile
confChartBeamPosition40Speed = confusionchart(beamPosition40Speed, beamPositionLabels);
confChartBeamPosition40Speed.FontName = "Times New Roman";
confChartBeamPosition40Speed.FontSize = 10;
confChartBeamPosition40Speed.XLabel = "";
confChartBeamPosition40Speed.YLabel = "";
title('(f)');

% beam position perpendicular confusion chart
nexttile
confCharBeamPositionPerp = confusionchart(beamPositionPerp, beamPositionLabels);
confCharBeamPositionPerp.FontName = "Times New Roman";
confCharBeamPositionPerp.FontSize = 10;
confCharBeamPositionPerp.XLabel = "";
confCharBeamPositionPerp.YLabel = "";
title('(g)');

% beam position parallel confusion chart
nexttile
confChartBeamPositionParallel = confusionchart(beamPositionParallel, beamPositionLabels);
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