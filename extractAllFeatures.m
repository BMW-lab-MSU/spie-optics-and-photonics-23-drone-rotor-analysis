% SPDX-License-Identifier: BSD-3-Clause
%% Setup
clear

if isempty(gcp('nocreate'))
    parpool();
end

baseDataDir ='../data';
rawDataDir = [baseDataDir filesep 'raw'];
preprocessedDataDir = [baseDataDir filesep 'preprocessed'];
rawDataFile = 'combined-data-2022-12-16.mat';

%% Load data
load([rawDataDir filesep rawDataFile])


%% Extract features
for scanNum = progress(1:numel(data))
    scanFeatures = cellfun(@(X) extractFeatures(X, 'UseParallel', true), ...
        data(scanNum).Data, 'UniformOutput', false);
    data(scanNum).Features = scanFeatures;
end


%% Save preprocessed data
mkdir(preprocessedDataDir);
save([preprocessedDataDir filesep 'preprocessedScans.mat'], ...
    'data', '-v7.3');
