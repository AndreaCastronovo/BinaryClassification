%% *** ANDREA CASTRONOVO 09/10/2020 ***

%% Si crei una matrice a 3 dimensioni, con dimensioni fornite dall’utente, di
% numeri casuali interi tra 0 e 9. Si fornisca in uscita la frequenza di
% ciascun elemento.

%% *********************    PRIMO SCRIPT LUNGO   **************************

%{

% Creazione matrice e input da tastiera
dim = input("Enter dimension matrix: ");
Matrix_3D = randi([0,9], dim, dim, dim);

% Calcolo frequenza ciascun elemento
tabl_1 = tabulate(Matrix_3D(1,:)); %%tabulate per la prima sezionezione della matrice
for i = 2 : dim
    tabl_loop = tabulate(Matrix_3D(i,:));
    for j = 1 : 10
    tabl_1(j,2) = tabl_1(j,2) + tabl_loop(j,2); %%numero totale di ripetizione singolo valore
    end
end

for i = 1 : 10
    tabl_1(i,3) = 100 * tabl_1(i,2)/dim^3; %%sovvrascrivo la frequenza percentuale
end

% Display frequenza
fprintf('Value    Count   Percent \n');
for i = 1 : 10
    fprintf('    %d  %7.d   %6.2f%%\n',tabl_1(i,1),tabl_1(i,2),tabl_1(i,3));
end

%}

%% *********************    SECONDO SCRIPT  ******************************

% Creazione matrice e input da tastiera
dim1 = input("Enter dimension1 matrix: ");
dim2 = input("Enter dimension2 matrix: ");
dim3 = input("Enter dimension3 matrix: ");
Matrix_3D = randi([0,9], dim1, dim2, dim3);

% Riduzione matrice a vettore
Vector = Matrix_3D(:);

% Frequenza elementi
tabulate(Vector)
