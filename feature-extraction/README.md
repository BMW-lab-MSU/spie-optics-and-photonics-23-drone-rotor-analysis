# Feature extraction code

The main entry point is `extractFeatures.m`

## How to extract features

```matlab
% load data
...

% turn data into a big matrix
d = nestedcell2mat(trainingData);

% extract features
features = extractFeatures(d, 'UseParallel', true);
```
