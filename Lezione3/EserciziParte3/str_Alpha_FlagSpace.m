%% ANDREA CASTRONOVO    17/12/2020

%% STRING FUNCTION
%   Function to select alphabetic characters in a string input and, if you
%   want (flag), space!

function outputString = str_Alpha_FlagSpace(inputStr, space_flag)

    %Vettore di indici booleani rappresentativi delle posizioni dei caratt. alfabeto
    i_boolean = isstrprop(inputStr, 'alpha');

    %space?
    if space_flag
         i_boolean_space = isstrprop(inputStr, 'wspace');
         i_boolean = i_boolean | i_boolean_space;
    end

    i_linear = find(i_boolean);

    outputString = inputStr(i_linear);

end