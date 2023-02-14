close all;
clear;


%load models trained on perpendicular data to detect speed and test on
%onAxis data 


load('../models/perpendicular/speed-models/trainedModels.mat');
load('../models/onAxis/onAxisData.mat');

tic
key = nestedcell2mat(onAxisSpeedLabels);
testingFeatures = nestedcell2mat(onAxisFeatures);
figure();
sgtitle('Perpendicular Speed Models Tested on onAxis Data')
toc

tic
predictions = mediumTree.predictFcn(testingFeatures);
subplot(2,6,1);
confusionchart(key,predictions);
title('mediumTree');
toc

tic
predictions = baggedTrees.predictFcn(testingFeatures);
subplot(2,6,2);
confusionchart(key,predictions);
title('baggedTrees');
toc

tic
predictions = bilayerNeuralNet.predictFcn(testingFeatures);
subplot(2,6,3);
confusionchart(key,predictions);
title('bilayerNeuralNet');
toc

tic
predictions = coarseTree.predictFcn(testingFeatures);
subplot(2,6,4);
confusionchart(key,predictions);
title('coarseTree');
toc

tic
predictions = fineGaussianSVM.predictFcn(testingFeatures);
subplot(2,6,5);
confusionchart(key,predictions);
title('fineGaussianSVM');
toc

tic
predictions = fineTree.predictFcn(testingFeatures);
subplot(2,6,6);
confusionchart(key,predictions);
title('fineTree');
toc

tic
predictions = linearSVM.predictFcn(testingFeatures);
subplot(2,6,7);
confusionchart(key,predictions);
title('linearSVM');
toc

tic
predictions = mediumNeuralNet.predictFcn(testingFeatures);
subplot(2,6,8);
confusionchart(key,predictions);
title('mediumNeuralNet');
toc

tic
predictions = narrowNeuralNet.predictFcn(testingFeatures);
subplot(2,6,9);
confusionchart(key,predictions);
title('narrowNeuralNet');
toc

tic
predictions = trilayerNeuralNet.predictFcn(testingFeatures);
subplot(2,6,10);
confusionchart(key,predictions);
title('trilayerNeuralNet');
toc

tic
predictions = wideNeuralNet.predictFcn(testingFeatures);
subplot(2,6,11);
confusionchart(key,predictions);
title('wideNeuralNet');
toc

tic
predictions = quadraticSVM.predictFcn(testingFeatures);
subplot(2,6,12);
confusionchart(key,predictions);
title('quadraticSVM');
toc 

%load models trained on perpendicular data to detect position and test on
%onAxis data

clear;


load('../models/perpendicular/postion-models/trainedModels.mat');
load('../models/onAxis/onAxisData.mat');

tic
key = nestedcell2mat(onAxisPositionLabels);
testingFeatures = nestedcell2mat(onAxisFeatures);
figure();
sgtitle('Perpendicular Position Models Tested on onAxis Data');
toc

tic
predictions = mediumTree.predictFcn(testingFeatures);
subplot(2,6,1);
confusionchart(key,predictions);
title('mediumTree');
toc

tic
predictions = baggedTrees.predictFcn(testingFeatures);
subplot(2,6,2);
confusionchart(key,predictions);
title('baggedTrees');
toc

tic
predictions = bilayerNeuralNet.predictFcn(testingFeatures);
subplot(2,6,3);
confusionchart(key,predictions);
title('bilayerNeuralNet');
toc

tic
predictions = coarseTree.predictFcn(testingFeatures);
subplot(2,6,4);
confusionchart(key,predictions);
title('courseTree');
toc

tic
predictions = fineGaussianSVM.predictFcn(testingFeatures);
subplot(2,6,5);
confusionchart(key,predictions);
title('fineGaussianSVM');
toc

tic
predictions = fineTree.predictFcn(testingFeatures);
subplot(2,6,6);
confusionchart(key,predictions);
title('fineTree');
toc

tic
predictions = linearSVM.predictFcn(testingFeatures);
subplot(2,6,7);
confusionchart(key,predictions);
title('linearSVM');
toc

tic
predictions = mediumNeuralNet.predictFcn(testingFeatures);
subplot(2,6,8);
confusionchart(key,predictions);
title('mediumNeuralNet');
toc

tic
predictions = narrowNeuralNet.predictFcn(testingFeatures);
subplot(2,6,9);
confusionchart(key,predictions);
title('narrowNeuralNet');
toc

tic
predictions = trilayerNeuralNet.predictFcn(testingFeatures);
subplot(2,6,10);
confusionchart(key,predictions);
title('trilayerNeuralNet');
toc

tic
predictions = wideNeuralNet.predictFcn(testingFeatures);
subplot(2,6,11);
confusionchart(key,predictions);
title('wideNeuralNet');
toc

tic
predictions = quadraticSVM.predictFcn(testingFeatures);
subplot(2,6,12);
confusionchart(key,predictions);
title('quadraticSVM');
toc

