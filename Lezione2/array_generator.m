% ANDREA CASTRONOVO 15/12/2020 ____ARRAY___

%% VETTORI

%%Creazione di un vettore di 5 elementi
    %%Per riga
    row_vector1 = [1, 2, 3, 4, 5];
    row_vector2 = [1 2 3 4 5];
    row_vector3 = 1:1:5; %Stesse motodologie di creazione
    %%Per colonna
    col_vector1 = [1; 2; 3; 4; 5];
    col_vector2 = (1:1:5).'; %Trasposizione
    
%%Vettore di elementi da 1 a 40 con passo 0.2
 g_vector = 1:0.2:40;

%%Concatenazione di più vettori
 first_vector = 1:0.1:10;
 second_vector = 11:0.2:20;

 conc = [first_vector, second_vector]; %per riga
 % conc = [first_vector; second_vector];  %per colonna, ***ERRORE*** per dimensione

%%Trasposizione di vettori complessi
 a = 1 + 1i;
 b = 2 - 1i*3;
 c = -5 + 1i*0.2;
 
 complex_vector = [a;b;c];
 
 % hermitiano: trasposizione + coniugato
 hermit = complex_vector';
 % trasposizione semplice
 traspost = complex_vector.';

%% MATRICI

A = [1, 2, 3 ; 4, 5, 6];
B = ones(size(A)); %Matrice di valori unitari di dimensione pari a quella di A

%how to convert matrix in vector
A_vector = A(:);

%% INDICIZZAZIONE

 %Vettori
    % x = row_vector1(0)  ****ERRORE****
    x = row_vector1(1); %primo elemento
    y = row_vector1(end); %ultimo elemento

    my_index = 1:2:numel(g_vector); %Non potendo utilizzare end, creo vettore per l'indicizzazione
    w = g_vector(my_index); %stesso campionamento ma a passi di 0.4

 %Matrici
    sing_elem = A(1,end);
    
%% OPERAZIONI

matrix_sum = A + B;
matrix_diff = A - B;

% C = A * B; ***ERRORE*** a livello dimensionale

C = A * B'; %%Prodotto matriciale
D = A .* B; %%Prodotto elemento per elemento dei singoli valori
