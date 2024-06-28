%   ANDREA CASTRONOVO   16/12/2020

%% INDICIZZAZIONE LOGICA
    
    % CREATION OF BOOLEAN VARIABLE
    t = true;
    f = false; %creazione di due variabili logiche (booleane: true & false)
    
    % INDEXING
    Sudoku = magic(10); %creation of quadratic matrix 10 dim.
    limit = 23; 
    condition_boolean = Sudoku <= 23; %matrix of boolean at the verifed condition
    i_linear = find(condition_boolean); %linear indices where condition is verified in Sudoku
    [i_row, i_col, values_cond] = find(condition_boolean); %default indices, in row & colum, where condition is verified in Sudoku and values of matrix 'condition' where booelean is true
    
    % VALUES THAT VERIFIED CONDITION
    values_Sudoku = Sudoku(condition_boolean); %vector of values where condition is verified in Sudoku
    
    % NUMBER OF ELEMENT THAT VERIFIED CONDITION
    n_limit  = numel(values_Sudoku);
    n_limit2 = sum(sum(condition_boolean));
    n_limit3 = sum(condition_boolean(:));
    
    % SUM ELEMENT OF 'SUDOKU' THAT VERIFIED CONDITION
    sum_values_Sudoku = sum(values_Sudoku);
    