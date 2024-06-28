%% Setup ==================================================================
clear
clc

rng default

addpath('Dataset') % aggiunta della cartella dei dataset al path

%% Importazione dei dati ==================================================

fileName = 'Mall_Customers.csv';
myData   = readtable(fileName); % ,'ReadVariableNames',false

%% Pre-processing =========================================================

data = myData(:,4:5);

% Missing data ------------------------------------------------------------
% missing_data = ismissing(data);
% missing_data_sum = sum(missing_data);

% Outliers ----------------------------------------------------------------
% outlier_income = isoutlier(data.AnnualIncome,'mean');
% outlier_income_sum = sum(outlier_income);
% outlier_score = isoutlier(data.SpendingScore,'mean');
% outlier_score_sum = sum(outlier_score);

% Feature scaling ---------------------------------------------------------
% Standardizzazione
data.AnnualIncome = (data.AnnualIncome - mean(data.AnnualIncome)) / std(data.AnnualIncome);
data.SpendingScore = (data.SpendingScore - mean(data.SpendingScore)) / std(data.SpendingScore);

% Categorical -------------------------------------------------------------
% non ve ne sono

%% Clustering =============================================================

% conversione in array numerico per le funzioni di HC
data = table2array(data);

% Hierarchical clustering -------------------------------------------------
Z = linkage(data, 'ward');

% Dendrogramma ------------------------------------------------------------
% dendrogram(Z,0) % tutte le osservazioni
dendrogram(Z)

% Coefficiente di inconsistenza -------------------------------------------
inconsistency_coeff = inconsistent(Z,7);

[max_inconsistency,row_max] = max(inconsistency_coeff(:,4));

% Clustering --------------------------------------------------------------
C = cluster(Z, 'cutoff', Z(row_max,3)-0.1,'Criterion','distance');

%% Cluster plot ===========================================================

cluster_size = numel(unique(C));

figure

gscatter(data(:,1),data(:,2),C)

hold on

my_legend = cell(1,cluster_size);
for ii = 1:cluster_size
   
    my_legend{ii} = strcat('{Cluster }',num2str(ii));
    
end
legend(my_legend)
xlabel('Annual Income')
ylabel('Spending Score')
hold off