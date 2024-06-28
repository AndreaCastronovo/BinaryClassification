%% *** ANDREA CASTRONOVO 09/10/2020 ***

%% Si crei un array 1D di valori interi casuali tra 1 e 30 con dimensione
% fornita dall’utente. Si fornisca in uscita un array che contenga gli
% elementi unici, ovvero l’array senza ripetizione di elementi.

%% ***********************************************************************

% Richiesta input dimensione e creazione array
row = input("Enter row of array: ");
col = input("Enter colum of array: ");
Array = randi(30, row, col);

% Elementi unici
Vector2 = unique(Array);