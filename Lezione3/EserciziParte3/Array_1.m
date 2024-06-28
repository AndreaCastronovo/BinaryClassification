%% *** ANDREA CASTRONOVO 09/10/2020 ***

%% Si crei una matrice con 15 valori interi da 1 a 10 (assegnazione diretta).
% Si cerchino tutti gli indici dei valori minori o uguali a 4 e se ne calcoli la
% percentuale rispetto al totale. Si trovi il modo di eseguire le operazioni
% col minor numero di istruzioni.

%% ************************************************************************

% Creazione Matrice 3x5 da 15 valori interi (1:10)
Matrix = randi(10, 3, 5);

% Ricerca valori che rispettano la condizione
Index = find(Matrix <= 4);

% Calcolo in percentuale del numero di elementi minori o uguali di 4
disp("Percentuale del numero di elementi minori o uguali a 4: " + (numel(Index) * 100)/15 + "%");

