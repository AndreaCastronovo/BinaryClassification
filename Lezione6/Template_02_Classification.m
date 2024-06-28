%% Setup ==================================================================
clear
clc

addpath('Dataset') % aggiunta della cartella dei dataset al path
addpath('Functions')

%% Importazione dei dati ==================================================

fileName = 'Social_Network_Ads.csv';
myData   = readtable(fileName); % ,'ReadVariableNames',false

%% Pre-processing =========================================================

data = myData(:,3:end); % per semplicità prendiamo solo età e salario

% Missing data ------------------------------------------------------------
%  missing_data     = ismissing(data(:,1:2));
%  missing_data_sum = sum(missing_data);

% Feature scaling ---------------------------------------------------------
% Standardizzazione
data.Age = (data.Age - mean(data.Age)) / std(data.Age);
data.EstimatedSalary = (data.EstimatedSalary - mean(data.EstimatedSalary)) / std(data.EstimatedSalary);

% Outliers ----------------------------------------------------------------
%  outlier_age = isoutlier(data.Age,'mean'); %3 sigma
%  outlier_age_sum = sum(outlier_age);
%  outlier_salary = isoutlier(data.EstimatedSalary,'mean');
%  outlier_salary_sum = sum(outlier_salary);

% Categorical -------------------------------------------------------------
% non necessario

%% Data partition =========================================================
rng default

num_observations = size(data,1);

% Hold Out ----------------------------------------------------------------
%  data_partition = cvpartition(num_observations,'HoldOut',0.2);
%  training_set = training(data_partition);
%  test_set = test(data_partition);

% k-fold ------------------------------------------------------------------
 data_partition = cvpartition(num_observations,'kfold',5);
%  training_set_1 = training(data_partition,1); % primo training set
%  test_set_1  = test(data_partition,1); % primo test set
%  training_set_2 = training(data_partition,2); % secondo training set
%  test_set_2  = test(data_partition,2); % secondo test set
%  training_set = [training_set_1,training_set_2];
%  test_set = [test_set_1,test_set_2];

%% Model generation =======================================================

% k-nearest neighbour -----------------------------------------------------
% classification_model = fitcknn(data,'Purchased~EstimatedSalary+Age');
%  classification_model = fitcknn(data,'Purchased','NumNeighbors',5);
  
% support vector machine --------------------------------------------------
% classification_model = fitcsvm(data,'Purchased');
 classification_model = fitcsvm(data,'Purchased','KernelFunction','gaussian');

% decision tree -----------------------------------------------------------
% classification_model = fitctree(data,'Purchased');

% ottimizzazione di iper-parametri del singolo algoritmo ------------------
% classification_model = fitcknn(data,'Purchased','OptimizeHyperparameters','auto',...
%                        'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%                        'expected-improvement-plus'));

% ottimizzazione generale di iper-parametri -------------------------------
% classification_model = fitcauto(data,'Purchased');

% regioni di decisione senza cross-validation -----------------------------
%  X = table2array(data(:,1:end-1));
%  x1range = min(X(:,1)):0.01:max(X(:,1));
%  x2range = min(X(:,2)):0.01:max(X(:,2));
%  [xx1, xx2] = meshgrid(x1range,x2range);
%  Xgrid = [xx1(:) xx2(:)];
%  
%  predictions = predict(classification_model,Xgrid);
%  
%  gscatter(xx1(:),xx2(:),predictions,'rgb')

% predizione su nuovi dati: vanno standardizzati concordemente!
%  new_age = 40;
%  new_salary = 73528;
%  new_age = (new_age - mean(data.Age)) / std(data.Age);
%  new_salary = (new_salary - mean(data.EstimatedSalary)) / std(data.EstimatedSalary);
%  predictions = predict(classification_model,[new_age,new_salary]);

%% Cross-validation =======================================================

cross_validated_model = crossval(classification_model,'cvpartition',data_partition);

% Visualizzazione decision tree
% view(cross_validated_model.Trained{1},'Mode','Graph')

%% Prediction =============================================================

% predictions = predict(cross_validated_model.Trained{1},data(test(data_partition,1),1:end-1));
predictions = kfoldPredict(cross_validated_model);

%% Confusion matrix =======================================================

% confusion_matrix = confusionmat(data(test(data_partition),end),predictions);
%confusion_matrix = confusionmat(cross_validated_model.Y(test(data_partition)),predictions);

% Calcolo delle prestazioni
%  accuracy    = 100 * sum(diag(confusion_matrix)) / sum(sum(confusion_matrix));
%  sensitivity = 100 * confusion_matrix(1,1) / sum(confusion_matrix(1,:));
%  precision   = 100 * confusion_matrix(1,1) / sum(confusion_matrix(:,1));
%  Fmeasure    = (2 * sensitivity * precision) / (sensitivity + precision);

% Plot della confusion matrix ---------------------------------------------
%  cm = confusionchart(cross_validated_model.Y(test(data_partition)),predictions);
%  cm.RowSummary = 'row-normalized';
%  cm.ColumnSummary = 'column-normalized';

% confusion matrix per k-fold ---------------------------------------------
 cm = confusionchart(table2cell(data(:,end)),predictions);

%% Region plot ============================================================

 plotDecisionRegion(cross_validated_model,data_partition,data)
% plotDecisionRegionKSVM(cross_validated_model,data_partition,data)


