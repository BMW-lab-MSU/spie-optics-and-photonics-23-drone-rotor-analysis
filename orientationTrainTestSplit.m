% SPDX-License-Identifier: BSD-3-Clause
%% Setup
clear

% Set random number generator properties for reproducibility
rng(0, 'twister');

rawDataDir = '../data/preprocessed';
newDataDir = '../data';
datafile = 'preprocessedScans.mat';

%% Folder indices for the on-axis and perpendicular orientation data
onAxisOrientationIdx = [1,2,3,4,5,6,7,8,21,22,23,24];
perpendicularOrientationIdx = [9,10,11,12,13,14,15,16,17,18,19,20];

%% Load data
load([rawDataDir filesep datafile])

%% Restructure the data structures to be more conducive
labels = {data.Labels}';
speedLabels = {data.SpeedLabels}';
positionLabels = {data.PositionLabels}';
orientationLabels = {data.OrientationLabels}';
dataCellArray = {data.Data}';
featuresCellArray = {data.Features}';


onAxisData = dataCellArray(onAxisOrientationIdx);
perpendicularData = dataCellArray(perpendicularOrientationIdx);

onAxisFeatures = featuresCellArray(onAxisOrientationIdx);
perpendicularFeatures = featuresCellArray(perpendicularOrientationIdx);

onAxisLabels = labels(onAxisOrientationIdx);
perpendicularLabels = labels(perpendicularOrientationIdx);
onAxisSpeedLabels = speedLabels(onAxisOrientationIdx);
perpendicularSpeedLabels = speedLabels(perpendicularOrientationIdx);
onAxisPositionLabels = positionLabels(onAxisOrientationIdx);
perpendicularPositionLabels = positionLabels(perpendicularOrientationIdx);
onAxisOrientationLabels = orientationLabels(onAxisOrientationIdx);
perpendicularOrientationLabels = orientationLabels(perpendicularOrientationIdx);

%% Save training and testing data
% mkdir(newDataDir, 'testing');
save([newDataDir filesep 'on-axis' filesep 'onAxisData.mat'], ...
    'onAxisData', 'onAxisFeatures', 'onAxisLabels', ...
    'onAxisOrientationLabels', 'onAxisPositionLabels', ...
    'onAxisSpeedLabels', '-v7.3');

% mkdir(newDataDir, 'training');
save([newDataDir filesep 'perpendicular' filesep 'perpendicularData.mat'], ...
    'perpendicularData', 'perpendicularFeatures', 'perpendicularLabels', ...
    'perpendicularOrientationLabels', 'perpendicularPositionLabels', ...
    'perpendicularSpeedLabels', '-v7.3');