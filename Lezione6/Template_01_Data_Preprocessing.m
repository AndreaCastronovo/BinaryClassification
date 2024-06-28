%% Setup ******************************************************************
clear
clc
close all %Chiusura di tutte le figure

%Aggiunta cartelle path
addpath('Dataset') % aggiunta della cartella dei dataset al path
addpath('Functions')

%% Importazione dei dati **************************************************

fileName = 'Data_missing_1.csv';
myData   = readtable(fileName); % ,'ReadVariableNames',false

%% Missing data ***********************************************************

% Rimozione di dati -------------------------------------------------------
 completeData = rmmissing(myData); % eliminazione righe
 completeData = rmmissing(myData,2); % eliminazione colonne

% Rimozione di dati con soglia --------------------------------------------
 missing_rate = 0.5; %Soglia in percentuale per eliminazione NaN
 num_missing  = round(missing_rate * (size(myData,2)-1)); %Numero min di dati mancanti per l'eliminazione
 completeData = rmmissing(myData,'MinNumMissing',num_missing);%Eliminazio righe con dati mancanti oltre soglia

% Sostituzione con media --------------------------------------------------
 completeData        = myData;
 meanAge             = mean(completeData.Age,'omitnan');
 completeData.Age    = fillmissing(completeData.Age,'constant',meanAge);%Sostituzione dati mancanti con media
 meanSalary          = mean(completeData.Salary,'omitnan');
 completeData.Salary = fillmissing(completeData.Salary,'constant',meanSalary);

% Back-fill ---------------------------------------------------------------
 completeData = fillmissing(myData,'previous'); %Sostituisci NaN con valore precedente
% Forward-fill ------------------------------------------------------------
 completeData = fillmissing(myData,'next'); %Sostituisci NaN con valore antecedente

% Categorici --------------------------------------------------------------
 fileName             = 'Data_missing_2.csv';
 myData               = readtable(fileName);
 completeData         = myData;
 completeData.Opinion = categorical(completeData.Opinion);
 most_freq_opinion    = mode(completeData.Opinion);
 completeData.Opinion = fillmissing(completeData.Opinion,'constant',string(most_freq_opinion));

%% Feature scaling ********************************************************

clear
clc
close all %Chiusura di tutte le figure

fileName = 'Data_full.csv';
myData   = readtable(fileName); % ,'ReadVariableNames',false

% Standardisation ---------------------------------------------------------
 myData.Age = (myData.Age - mean(myData.Age))/std(myData.Age);
 myData.Salary = (myData.Salary - mean(myData.Salary))/std(myData.Salary);

% Normalisation -----------------------------------------------------------
 myData.Age = (myData.Age - min(myData.Age))/(max(myData.Age) - min(myData.Age));
 myData.Salary = (myData.Salary - min(myData.Salary))/(max(myData.Salary) - min(myData.Salary));

%% Outliers ***************************************************************

% Identificazione
 outlierAge = isoutlier(myData.Age); % 3 MAD
 outlierAge = isoutlier(myData.Age,'mean'); % 3 sigma
 outlierSalary = isoutlier(myData.Salary,'mean'); % 3 sigma

% Cancellazione
 newData = myData(~outlierAge,:);

% Sostituzione
 newData = myData;
 newData.Age = filloutliers(newData.Age,'center'); % mediana
 newData.Age = filloutliers(newData.Age,'linear'); % interpolazione
 newData.Age = filloutliers(newData.Age,'previous'); % elemento precedente
 newData.Age = filloutliers(newData.Age,'next'); % elemento successivo

%% Categorical data *******************************************************

fileName = 'Data_categorical.csv';
myData   = readtable(fileName);
newData = myData;

% Senza ordinamento
newData = encodeCategorical(newData,'Refund');
newData = encodeCategorical(newData,'MaritalStatus');

% Con ordinamento
newData.YearlyIncome = encodeCategoricalN(newData.YearlyIncome, ...
                        {'Low','Average','High','Very High'},...
                        [1 2 3 6]);

