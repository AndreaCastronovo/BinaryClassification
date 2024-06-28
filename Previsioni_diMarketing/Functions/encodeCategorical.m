function data = encodeCategorical(data,variableName)
% This function converts the categorical variable to a binary sequence.
% Input:
%   - data: input data in table format
%   - variable: string providing the variable name
% Output:
%   - data: output data in table format with dummy variables

% Identification of the unique values of the categorical data:
eval(strcat('variable = data.',variableName,';'))
uniqueValues = unique(variable);
name_UniqueValues = strcat(uniqueValues,'.',variableName);

% Convert each categorical option to a binary code:
nValues       = numel(uniqueValues);
nCategorical  = numel(variable);
dummyVariable = zeros(nCategorical,numel(uniqueValues));
for ii=1:nValues
    dummyVariable(:,ii) = double(ismember(variable,uniqueValues{ii})) ;
end 

% Concatenate the dummy columns to a table:
T = table;
for ii=1:nValues
    T1 = table(dummyVariable(:,ii));
    T1.Properties.VariableNames = name_UniqueValues(ii);
    T = [T T1];
end 

% Concatenate the dummy variables to the other IVs columns:
data = [T data];
eval(strcat('data.',variableName,' = [];'));