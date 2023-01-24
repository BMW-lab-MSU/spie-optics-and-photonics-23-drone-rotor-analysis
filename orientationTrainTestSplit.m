% SPDX-License-Identifier: BSD-3-Clause
%% Setup
clear

% Set random number generator properties for reproducibility
rng(0, 'twister');

rawDataDir = '../data/raw';
newDataDir = '../data';
datafile = 'combined-data-2022-12-16.mat';

%% Folder indices for the on-axis and perpendicular orientation data
onAxisOrientationIdx = [1,2,3,4,5,6,7,8,21,22,23,24];
perpendicularOrientationIdx = [9,10,11,12,13,14,15,16,17,18,19,20];

%% Load data
load([rawDataDir filesep datafile])

%% Restructure the data structures to be more conducive
labels = {data.Labels}';
dataCellArray = {data.Data}';


onAxisData = dataCellArray(onAxisOrientationIdx);
perpendicularData = dataCellArray(perpendicularOrientationIdx);
onAxisLabels = labels(onAxisOrientationIdx);
perpendicularLabels = labels(perpendicularOrientationIdx);


%% Save training and testing data
% mkdir(newDataDir, 'testing');
save([newDataDir filesep 'on-axis' filesep 'onAxisData.mat'], ...
    'onAxisData', 'onAxisLabels', '-v7.3');

% mkdir(newDataDir, 'training');
save([newDataDir filesep 'perpendicular' filesep 'perpendicularData.mat'], ...
    'perpendicularData', 'perpendicularLabels', '-v7.3');