%% *** ANDREA CASTRONOVO 09/10/2020 ***

%% Si crei un array 1D di 30 valori con numeri interi casuali tra 1 e 18. Si
% salvino poi gli elementi in posizioni dispari e quelli in posizioni pari in
% due nuovi array

%% ***********************************************************************

% Creazione array 1D
Vector = randi(18, 1, 30);

% Valori indice pari e dispari
Vector_even = Vector(2:2:end);
Vector_odd = Vector(1:2:end);