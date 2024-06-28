%% *** ANDREA CASTRONOVO 25/10/2020 ***

%% Per la matrice dell’esercizio precedente, si scriva un codice che fornisca
%  in uscita i valori unici diversi da 0 in un array.

%% ***********************************************************************

% Creazione matrice e input da tastiera
dim1 = input("Enter dimension1 matrix: ");
dim2 = input("Enter dimension2 matrix: ");
dim3 = input("Enter dimension3 matrix: ");
Matrix_3D = randi([0,9], dim1, dim2, dim3);

UniqueValues_NonZeros = unique(nonzeros(Matrix_3D));