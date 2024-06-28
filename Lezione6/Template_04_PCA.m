%% Setup ==================================================================
clear
clc
close all

rng default

addpath('Dataset')
addpath('Functions')

%% Importazione dei dati ==================================================

file_name = 'Wine.csv';
myData = readtable(file_name);

%% Pre-processing =========================================================

% non ci sono outlier e dati mancanti, da verificare come esercizio

% Conversione in array per utilizzare le prossime funzioni
data = table2array(myData(:,1:end-1));

% Feature scaling ---------------------------------------------------------
% Standardizzazione con ciclo for
for ii = 1:size(myData,2)-1
    data(:,ii) = (data(:,ii) - mean(data(:,ii))) / std(data(:,ii));
    myData(:,ii) = table(data(:,ii));
end

% Principal Component Analysis --------------------------------------------
% labels: serviranno per ricreare un dataset nello spazio definito dalla PCA
class_labels = myData(:,end); 

% calcoliamo la PCA
[~, score, ~, tsquared, explained,~] = pca(data);
% score: rappresentazione delle osservazioni nel principal component space
% tsquared: misura statistica di ogni osservazione
% explained: percentuale di varianza fornita da ogni component

sum(explained(1:2));
% le prime due dimensioni (di score) descrivono già più del 50% dello spazio

% nuovo dataset per classificazione
pcaData = table(score(:,1),score(:,2));
pcaData(:,end+1) = class_labels;

%% Classificazione ========================================================

% Data partition ----------------------------------------------------------
num_observation = size(pcaData,1);
data_partition = cvpartition(num_observation,'HoldOut',0.2);

% Fit del modello ---------------------------------------------------------
% class_model = fitcknn(pcaData,'Var3','OptimizeHyperparameters','auto');
class_model = fitcknn(pcaData,'Var3','NumNeighbors',4,'Distance','mahalanobis');

% Cross-validazione -------------------------------------------------------
cross_val_model = crossval(class_model,'cvpartition',data_partition);

% Predizioni --------------------------------------------------------------
predictions = predict(cross_val_model.Trained{1}, pcaData(test(data_partition),1:end-1));

% Confusion matrix --------------------------------------------------------
cm = confusionchart(cross_val_model.Y(test(data_partition)),predictions);

% Plot region -------------------------------------------------------------
figure
X = table2array(pcaData(:,1:2));
x1range = min(X(:,1)):.01:max(X(:,1));
x2range = min(X(:,2)):.01:max(X(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];

predicted_data = predict(cross_val_model.Trained{1},XGrid);
gscatter(xx1(:), xx2(:), predicted_data,'rgb');
hold on
gscatter(X(:,1),X(:,2),table2array(pcaData(:,3)))
hold off

rmpath('Dataset')
rmpath('Functions')