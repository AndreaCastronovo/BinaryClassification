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

% Rappresentazione dei dati nello spazio delle feature --------------------
scatter(table2array(data(:,1)),table2array(data(:,2)),24,'filled')
xlabel('Annual income')
ylabel('Spending score')

% Selezione numero di cluster ---------------------------------------------
data = table2array(data); % conversione per utilizzare le prossime funzioni

% % Con elbow method
% max_num_cluster = 14;
% WCSS = zeros(1,max_num_cluster);
% for k = 1:max_num_cluster
%     [~,~,sumd] = kmeans(data, k);
%     WCSS(k) = sum(sumd);
% end
% plot(1:max_num_cluster,WCSS,'-ob','LineWidth',1)
% xlabel('cluster size k')
% ylabel('WCSS')

% kmeans++ ----------------------------------------------------------------
cluster_size = 6; % da elbow method o fissato a priori
[idx,C] = kmeans(data, cluster_size); % data deve essere un array numerico

%% Cluster plot ===========================================================

figure

gscatter(data(:,1),data(:,2),idx)

hold on

myLegend = cell(1,cluster_size);
for ii = 1:cluster_size
    
    scatter(C(ii,1),C(ii,2),96,'black','filled')
    myLegend{ii} = strcat('{Cluster }',num2str(ii));
    
end

legend(myLegend)
xlabel('Annual income')
ylabel('Spending score')
hold off