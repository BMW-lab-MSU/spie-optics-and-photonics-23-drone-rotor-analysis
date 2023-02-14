close all;
clear;
tic
load('../models/random/trainedModels.mat');
load('../models/random/testingDataRandomSplit.mat');


key = nestedcell2mat(testingLabels);
tf = nestedcell2mat(testingFeatures);
figure();
sgtitle("Random Speed Models Trained on Random Data")

predictions = mediumTree.predictFcn(tf);
subplot(2,6,1);
confusionchart(key,predictions);
title('mediumTree');

predictions = baggedTrees.predictFcn(tf);
subplot(2,6,2);
confusionchart(key,predictions);
title('baggedTrees');

predictions = bilayerNeuralNet.predictFcn(tf);
subplot(2,6,3);
confusionchart(key,predictions);
title('bilayerNeuralNet');

predictions = courseTree.predictFcn(tf);
subplot(2,6,4);
confusionchart(key,predictions);
title('coarseTree');

predictions = fineGaussianSVM.predictFcn(tf);
subplot(2,6,5);
confusionchart(key,predictions);
title('fineGaussianSVM');

predictions = fineTree.predictFcn(tf);
subplot(2,6,6);
confusionchart(key,predictions);
title('fineTree');

predictions = linearSVM.predictFcn(tf);
subplot(2,6,7);
confusionchart(key,predictions);
title('linearSVM');

predictions = mediumNeuralNet.predictFcn(tf);
subplot(2,6,8);
confusionchart(key,predictions);
title('mediumNeuralNet');

predictions = narrowNeuralNet.predictFcn(tf);
subplot(2,6,9);
confusionchart(key,predictions);
title('narrowNeuralNet');

predictions = trilayerNeuralNet.predictFcn(tf);
subplot(2,6,10);
confusionchart(key,predictions);
title('trilayerNeuralNet');

predictions = wideNeuralNet.predictFcn(tf);
subplot(2,6,11);
confusionchart(key,predictions);
title('wideNeuralNet');

predictions = quadraticSVM.predictFcn(tf);
subplot(2,6,12);
confusionchart(key,predictions);
title('quadraticSVM');

% 
toc






% ietc/training/models : data labeled 0,1,2 for presence of oscillations.
% Partitioned randomly

