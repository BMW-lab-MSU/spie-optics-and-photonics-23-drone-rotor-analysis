% SPDX-License-Identifier: BSD-3-Clause
%% Load data
clear

datadir = '../data/on-axis';
datafile = 'onAxisData.mat';

load([datadir filesep datafile])

%% prepare data
features = nestedcell2mat(onAxisFeatures);
labels = nestedcell2mat(onAxisPositionLabels);

%% Run the classification learner
classificationLearner(features, labels);
