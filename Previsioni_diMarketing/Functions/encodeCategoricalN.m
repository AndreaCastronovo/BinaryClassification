function new_variable = encodeCategoricalN(variable,values_set,numbers) 
% This function converts the categorical variable to a number. The mapping
% between the category and the number is defined by the input variables' order. 
% Input:
%   - variable: column table variable of categoricals to be converted
%   - values_set: cell array of the categoricals to be converted
%   - numbers: values to be associated to the categoricals in values_set
% Output:
%   - new_variable: new dummy variable with ordered numbers

[rows,~]     = size(variable);
new_variable = zeros(rows,1);

for i=1:length(values_set)
    indices = ismember(variable,values_set{i});
    new_variable(indices) = numbers(i);
end