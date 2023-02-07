% SPDX-License-Identifier: BSD-3-Clause
%% Load data
clear

datadir = '../data/training';
datafile = 'trainingDataRandomSplit.mat';

load([datadir filesep datafile])

%% prepare data
features = nestedcell2mat(trainingFeatures);
labels = nestedcell2mat(trainingLabels);

%% Run the classification learner
classificationLearner(features, labels);