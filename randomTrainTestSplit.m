% SPDX-License-Identifier: BSD-3-Clause
%% Setup
clear

% Set random number generator properties for reproducibility
rng(0, 'twister');

rawDataDir = '../data/raw';
newDataDir = '../data';
datafile = 'combined-data-2022-12-16.mat';

%% Load data
load([rawDataDir filesep datafile])

%% Restructure the data structures to be more conducive
labels = {data.Labels}';
dataCellArray = {data.Data}';


%% Partition into training and test sets
TEST_PCT = 0.2;

holdoutPartition = cvpartition(length(dataCellArray), 'Holdout', TEST_PCT);

trainingData = dataCellArray(training(holdoutPartition));
testingData = dataCellArray(test(holdoutPartition));
trainingLabels = labels(training(holdoutPartition));
testingLabels = labels(test(holdoutPartition));


%% Save training and testing data
% mkdir(newDataDir, 'testing');
save([newDataDir filesep 'testing' filesep 'testingDataRandomSplit.mat'], ...
    'testingData', 'testingLabels', ...
    'holdoutPartition', '-v7.3');

% mkdir(newDataDir, 'training');
save([newDataDir filesep 'training' filesep 'trainingDataRandomSplit.mat'], ...
    'trainingData', 'trainingLabels', ...
    'holdoutPartition', '-v7.3');
