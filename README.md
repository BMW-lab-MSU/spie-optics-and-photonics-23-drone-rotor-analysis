# I-ETC 2023 Drone Propeller Rotation Analysis
This repository contains the code used in our paper *Preliminary Analysis of Drone Propeller Rotation using Wingbeat-Modulation LiDAR*, which has been submitted to the I-ETC 2023 conference.

# Path setup
Run the `setup.m` script to add the `feature-extraction` folder to your matlab path. Or just add it manually using `addpath()`

## Directory setup
The code has been written to use relative paths. This can be changed if desired.

Here's the directory structure this code is set to use:

```
i-etc-2023
├── code
│   ├── combineScans.m
│   ├── LICENSE
│   ├── nestedcell2mat.m
│   ├── orientationTrainTestSplit.m
│   ├── randomTrainTestSplit.m
│   └── README.md
└── data
    ├── on-axis
    ├── perpendicular
    ├── raw
    ├── testing
    └── training
```

# Recreating results
Our code is split into multiple parts: data wrangling and preprocessing, training, testing, and figure creation.

### Data wrangling
1. Run `combineScans.m` to combine all raw data into one data structure.
2. Run `extractAllFeatures.m` to preprocess the data and extract features.
3. Run `randomTrainTestSplit.m` and `orientationTrainTestSplit.m` to split the data into training and testing sets.

### Training
Run the `experiment*.m` files to run the training experiments. These scripts launch the Classification Learner with the appropriate data. You are then free to run whatever models you like in the Classification Learner.

Models must be exported and saved manually, unfortunately.

### Testing
Once the models have been trained and exported from the Classification Learner application, run the testing scripts:
- `testModel.m` tests the random split
- `perpendicularModelTest.m` tests the models trained on perpendicular data
- `onAxisModelTest.m` tests the models trained on on-axis/parallel data

### Figure creation
Figure creation scripts are in the `figures` directory. These scripts are designed to be run from the `figures` directory. If you run them from elsewhere, you'll need to update the data directory paths appropriately.
