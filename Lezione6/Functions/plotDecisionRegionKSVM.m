function plotDecisionRegionKSVM(crossValModel, dataPartition, data)
% This function plots the decision regions and the output for both the
% training and test sets. Note: 2D representation ==> data must have 3
% columns: the first two are the IVs and the third one provides the labels.
% Input:
%   - crossValModel: cross-validated model obtained from crossval.m
%   - dataPartition: data partition into training and test sets obtained
%                    from cvpartition
%   - data: observations table.

%% Recover data columns ***************************************************
dataLabels = data(:,end);
dataIV1    = table2array(data(:,1));
dataIV2    = table2array(data(:,2));

%% Training set ***********************************************************
labels          = table2cell(unique(dataLabels));
classifier_name = [crossValModel.CrossValidatedModel ' - Training'];

RangeIV1 = min(dataIV1(training(dataPartition)))-1:0.01:max(dataIV1(training(dataPartition)))+1;
RangeIV2 = min(dataIV2(training(dataPartition)))-1:0.01:max(dataIV2(training(dataPartition)))+1;

[xx1, xx2] = meshgrid(RangeIV1,RangeIV2);
XGrid = [xx1(:) xx2(:)];
 
predictionsMeshgrid = predict(crossValModel.Trained{1},XGrid);
 
figure

xxx = ismember(predictionsMeshgrid,'NotPurchased');
scatter(XGrid(xxx,1),XGrid(xxx,2), 'o' , 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red');

hold on
scatter(XGrid(~xxx,1),XGrid(~xxx,2), 'o' , 'MarkerEdgeColor', 'green', 'MarkerFaceColor', 'green');

 
trainingData = data(training(dataPartition),:);
Y = ismember(trainingData.Purchased,labels{1});
 
 
scatter(trainingData.Age(Y),trainingData.EstimatedSalary(Y), 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'red');
scatter(trainingData.Age(~Y),trainingData.EstimatedSalary(~Y) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'green');
 
 
xlabel('Age');
ylabel('Estimated Salary');
 
title(classifier_name);
legend off, axis tight
 
legend(labels,'Location',[0.45,0.01,0.45,0.05],'Orientation','Horizontal');

%% Test set ***************************************************************

figure

classifier_name = [crossValModel.CrossValidatedModel ' - Test'];

RangeIV1 = min(dataIV1(test(dataPartition)))-1:0.01:max(dataIV1(test(dataPartition)))+1;
RangeIV2 = min(dataIV2(test(dataPartition)))-1:0.01:max(dataIV2(test(dataPartition)))+1;

[xx1, xx2] = meshgrid(RangeIV1,RangeIV2);
XGrid = [xx1(:) xx2(:)];
 
predictionsMeshgrid = predict(crossValModel.Trained{1},XGrid);


xxx = ismember(predictionsMeshgrid,'NotPurchased');
scatter(XGrid(xxx,1),XGrid(xxx,2), 'o' , 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red');

hold on
scatter(XGrid(~xxx,1),XGrid(~xxx,2), 'o' , 'MarkerEdgeColor', 'green', 'MarkerFaceColor', 'green');

 
testData = data(test(dataPartition),:);
Y = ismember(testData.Purchased,labels{1});
 
 
scatter(testData.Age(Y),testData.EstimatedSalary(Y), 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'red');
scatter(testData.Age(~Y),testData.EstimatedSalary(~Y) , 'o' , 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'green');
 
 
xlabel('Age');
ylabel('Estimated Salary');
 
title(classifier_name);
legend off, axis tight
 
legend(labels,'Location',[0.45,0.01,0.45,0.05],'Orientation','Horizontal');
 