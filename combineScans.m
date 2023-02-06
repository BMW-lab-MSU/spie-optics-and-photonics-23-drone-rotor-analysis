% SPDX-License-Identifier: BSD-3-Clause
tic

N_ROWS = 178;
N_COLS = 1024;

DATA_FILENAME = "adjusted_data_junecal_volts.mat";
SPEED_LABELS_FILENAME = "speed_label.mat";
POS_LABELS_FILENAME = "position_label.mat";
ORIENTATION_LABELS_FILENAME = "orientation_label.mat";


rawDataDir = "../data/raw";

days = ["2022-12-16"];

scansIds = cell(numel(days), 1);

% Get all the folders that contain a scan
for i = 1:numel(days)
    % Grab the directories under the "day" folder
    tmp = string({dir(rawDataDir + filesep + days(i)).name});

    % Find the directories that contain scans (which contain a timestamp),
    % e.g. "RedLight-225413"
    match = regexp(tmp, '.*\d{6}');
    scanIdx = cellfun(@(c) ~isempty(c), match);
    scanIds{i} = tmp(scanIdx);
end

nScans = numel([scanIds{:}]);

data = struct('Day', string(), 'Id', string(), 'Data', cell(nScans, 1), ...
    'Labels', cell(nScans, 1), 'Pan', cell(nScans, 1), ...
    'Tilt', cell(nScans, 1), 'Range', cell(nScans, 1), 'Time', cell(nScans, 1));

if exist('ProgressBar')
    progbar1 = ProgressBar(nScans, 'UpdateRate', 1);
end

scanNum = 1;
for i = 1:numel(days)
    for j = 1:numel(scanIds{i})
        scanId = scanIds{i}(j);

        % Load data
        load(rawDataDir + filesep + days(i) + filesep + scanId ...
            + filesep + DATA_FILENAME);
        
        % Load labels
        speed = load(rawDataDir + filesep + days(i) + filesep + scanId ...
            + filesep + SPEED_LABELS_FILENAME);
        position = load(rawDataDir + filesep + days(i) + filesep + scanId ...
            + filesep + POS_LABELS_FILENAME);
        orientation = load(rawDataDir + filesep + days(i) + filesep + scanId ...
            + filesep + ORIENTATION_LABELS_FILENAME);

        data(scanNum).Day = days(i);
        data(scanNum).Id = scanIds{i}(j);

        % Convert data to single-precsion to reduce memory usage
        data(scanNum).Data = cellfun(@(c) single(c), ...
            {adjusted_data_junecal.data}', ...
            'UniformOutput', false);

        nImages = length(data(scanNum).Data);
        nRows = height(data(scanNum).Data{1});

        % Since the labels are the same for each image in a scan,
        % we only created one label vector; for ease of use, we replicate
        % the label vector for each image in the scan. For data structure
        % purposes, we create a cell array of the label vectors since the
        % images are a cell array of matrices.
        replicatedSpeedLabels = repmat(speed.label,nImages,1);
        data(scanNum).SpeedLabels = mat2cell(replicatedSpeedLabels,[nRows * ones(1,nImages)],1);

        replicatedPosLabels = repmat(position.label,nImages,1);
        data(scanNum).PositionLabels = mat2cell(replicatedPosLabels,[nRows * ones(1,nImages)],1);

        replicatedOrientationLabels = repmat(orientation.label,nImages,1);
        data(scanNum).OrientationLabels = mat2cell(replicatedOrientationLabels,[nRows * ones(1,nImages)],1);

        % Create labels for the 3-class problem: nothing, hard target, or
        % drone. nothing = 0, hard target = 1, drone = 2. Any orientation
        % label that is > 1 is a drone, so we just threshold those to 2
        % to create the drone label.
        droneLabels = replicatedOrientationLabels;
        droneLabels(droneLabels > 1) = 2;
        data(scanNum).Labels = droneLabels;

        % Grab metadata
        data(scanNum).Tilt = [adjusted_data_junecal.tilt]';
        data(scanNum).Pan = [adjusted_data_junecal.pan]';
        data(scanNum).Time = {adjusted_data_junecal.time}';
        data(scanNum).Range = {adjusted_data_junecal.range}';

        scanNum = scanNum + 1;

        if exist('ProgressBar')
            progbar1([],[],[])
        end
    end
end

save(rawDataDir + filesep + "combined-data-2022-12-16", 'data', '-v7.3');
toc
