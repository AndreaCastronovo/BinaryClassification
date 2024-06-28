%% Nome Cognome:    ANDREA CASTRONOVO
%     Matricola:    0000825149
%
%% ----------- PREVISIONI DI MARKETING (SUPERVISED LEARNING) -------------
%   
%   Classificatore binario su dataset 'Bankfull.csv' per la predizione
%   della sottoscrizione contratto clienti.

%% SETUP =================================================================

%Pulizia workspace e Command Window
 clear
 clc    

%Aggiunta cartelle dataset & funzioni al path
 addpath('Dataset')
 addpath('Functions')
 
%Ripetibilià classificazione
 rng ('default')
 
%% DATA IMPORT ===========================================================

%Lettura e salvataggio dei dati come variabile 'table'
 fileName = 'bankfull.csv';
 myData = readtable(fileName);
 data = myData(:,1:end-1);
 
%% PRE-PROCESING =========================================================

%Missing data ------------------------------------------------------------
 %missing_data = ismissing(myData);
 %missing_data_sum = sum(sum(missing_data)); *** NON CI SONO DATI MANCANTI ***

%Feature scaling ---------------------------------------------------------
 % Standardizzazione
 data.age = (data.age - mean(data.age)) / std(data.age);
 data.balance = (data.balance - mean(data.balance)) / std(data.balance);
 data.day = (data.day - mean(data.day)) / std(data.day);
 data.duration = (data.duration - mean(data.duration)) / std(data.duration);
 data.campaign = (data.campaign - mean(data.campaign)) / std(data.campaign);
 data.pdays = (data.pdays - mean(data.pdays)) / std(data.pdays);
 data.previous = (data.previous - mean(data.previous)) / std(data.previous);

%Outliers ----------------------------------------------------------------
 % Identificazione (MAD) e sostituzione (nearest non-outlier value)
 %data.day = filloutliers(data.day,'nearest'); *** NON CI SONO OUTLIER ***
 data.age = filloutliers(data.age,'nearest');
 data.balance = filloutliers(data.balance,'nearest');
 data.duration = filloutliers(data.duration,'nearest');
 data.campaign = filloutliers(data.campaign,'nearest');
 data.pdays = filloutliers(data.pdays,'nearest');
 data.previous = filloutliers(data.previous,'nearest');
 
%Categorical -------------------------------------------------------------
 % Feature senza ordinamento
 data = encodeCategorical(data,'job');
 data = encodeCategorical(data,'marital');
 data = encodeCategorical(data,'education');
 data = encodeCategorical(data,'default');
 data = encodeCategorical(data,'housing');
 data = encodeCategorical(data,'loan');
 data = encodeCategorical(data,'contact');
 data = encodeCategorical(data,'month');
 data = encodeCategorical(data,'poutcome');
 % Standardizzazione categorical
 data_array = table2array(data);
 for ii = 1:44
     data_array(:,ii) = (data_array(:,ii) - mean(data_array(:,ii))) / std(data_array(:,ii));
     data(:,ii) = table(data_array(:,ii));
 end

%Principal Component Analysis --------------------------------------------
 % Labels: serviranno per ricreare un dataset nello spazio definito dalla PCA
 class_labels = myData(:,end);
 % PCA
 [~, score, ~, ~, explained,~] = pca(data_array);
 % Nuovo dataset per classificazione
 pcaData = array2table(score(:,1:30));
 pcaData(:,end+1) = class_labels;
 
%% DATA PARTITION ========================================================

 num_observation = size(pcaData,1);
 
%K-fold ----------------------------------------------------------------
 data_partition = cvpartition(num_observation,'kfold',5);
 % Training & Test set
 training_set = zeros(num_observation,5);
 test_set = zeros(num_observation,5);
 for ii = 1:5
     training_set(:,ii) = training(data_partition,ii);
     test_set(:,ii) = test(data_partition,ii);
 end
 
%% MODEL GENERATION & CROSS VALIDATION ===================================

%Linear Classification ---------------------------------------------------  
 classification_model = fitclinear(pcaData,'Var31','Lambda',1.062e-05,'Learner','logistic',...
                                   'CVPartition',data_partition);
                   
%% PREDICTION ============================================================

 predictions = kfoldPredict(classification_model);
 
%% CONFUSION MATRIX ======================================================
 
 cm = confusionchart(table2cell(pcaData(:,end)),predictions);
 cm.Title = 'Confusion Matrix';
 
%Calcolo delle prestazioni -----------------------------------------------
 accuracy    = 100 * sum(diag(cm.NormalizedValues)) / sum(sum(cm.NormalizedValues));
 sensitivity = 100 * cm.NormalizedValues(1,1) / sum(cm.NormalizedValues(1,:));
 precision   = 100 * cm.NormalizedValues(1,1) / sum(cm.NormalizedValues(:,1));
 Fmeasure    = (2 * sensitivity * precision) / (sensitivity + precision);
