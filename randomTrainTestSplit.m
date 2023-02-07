% SPDX-License-Identifier: BSD-3-Clause
%% Setup
clear

% Set random number generator properties for reproducibility
rng(0, 'twister');

rawDataDir = '../data/preprocessed';
newDataDir = '../data';
datafile = 'preprocessedScans.mat';

%% Load data
load([rawDataDir filesep datafile])

%% Restructure the data structures to be more conducive
labels = {data.Labels}';
speedLabels = {data.SpeedLabels}';
positionLabels = {data.PositionLabels}';
orientationLabels = {data.OrientationLabels}';
dataCellArray = {data.Data}';
featuresCellArray = {data.Features}';


%% Partition into training and test sets
TEST_PCT = 0.2;

holdoutPartition = cvpartition(length(dataCellArray), 'Holdout', TEST_PCT);

trainingData = dataCellArray(training(holdoutPartition));
testingData = dataCellArray(test(holdoutPartition));

trainingFeatures = featuresCellArray(training(holdoutPartition));
testingFeatures = featuresCellArray(test(holdoutPartition));

trainingLabels = labels(training(holdoutPartition));
testingLabels = labels(test(holdoutPartition));
trainingSpeedLabels = speedLabels(training(holdoutPartition));
testingSpeedLabels = speedLabels(test(holdoutPartition));
trainingPositionLabels = positionLabels(training(holdoutPartition));
testingPositionLabels = positionLabels(test(holdoutPartition));
trainingOrientationLabels = orientationLabels(training(holdoutPartition));
testingOrientatinoLabels = orientationLabels(test(holdoutPartition));


%% Save training and testing data
% mkdir(newDataDir, 'testing');
save([newDataDir filesep 'testing' filesep 'testingDataRandomSplit.mat'], ...
    'testingData', 'testingLabels', 'testingSpeedLabels', ...
    'testingOrientatinoLabels', 'testingPositionLabels', ...
    'testingFeatures', 'holdoutPartition', '-v7.3');

% mkdir(newDataDir, 'training');
save([newDataDir filesep 'training' filesep 'trainingDataRandomSplit.mat'], ...
    'trainingData', 'trainingLabels', 'trainingSpeedLabels', ...
    'trainingOrientationLabels', 'trainingPositionLabels', ...
    'trainingFeatures', 'holdoutPartition', '-v7.3');
