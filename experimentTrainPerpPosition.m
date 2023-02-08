% SPDX-License-Identifier: BSD-3-Clause
%% Load data
clear

datadir = '../data/perpendicular';
datafile = 'perpendicularData.mat';

load([datadir filesep datafile])

%% prepare data
features = nestedcell2mat(perpendicularFeatures);
labels = nestedcell2mat(perpendicularPositionLabels);

%% Run the classification learner
classificationLearner(features, labels);