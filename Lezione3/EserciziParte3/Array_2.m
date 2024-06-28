%% *** ANDREA CASTRONOVO 09/10/2020 ***

%% Con la stessa matrice dell’esercizio 1, si scrivano le istruzioni per
% invertire le colonne della matrice (la colonna 1 diventa l’ultima, la 2 la
% penultima, etc.) e salvare il risultato in una nuova matrice. Si ripeta
% l’operazione invertendo le righe. Si cerchi infine il modo di eseguire le
% operazioni col minor numero di istruzioni.

%% ***********************************************************************

% Creazione Matrice 3x5 da 15 valori interi (1:10)
Matrix = randi(10, 3, 5);

% Inverto colonne e righe
MatrixInverted_column = fliplr(Matrix);
MatrixInverted_row = flipud(Matrix);
