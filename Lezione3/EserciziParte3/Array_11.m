% ANDREA CASTRONOVO 18/12/2020

%% Dati due array generati casualmente, si forniscano gli array che
%  definiscono la loro intersezione e la loro unione.

%% -----------------------------------------------------------------------

    %Generazione casuale array
        array_1 = randi(20,10);
        array_2 = randi([10,15],2,30);
        
    %Intersezione
        array_intersection = intersect(array_1,array_2);
        array_union        = union(array_1,array_2);
        
        