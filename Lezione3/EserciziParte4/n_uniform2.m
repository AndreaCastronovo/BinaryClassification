% ANDREA CASTRONOVO     19/12/2020
%
%%   Funzione che fornisce in uscita il numero di numeri casuali uniformi 
%    tra 0 e 1 che è stato necessario generare per ottenere un valore 
%    tra 0.8 e 0.85.
%
%% number = n_uniform(n_int_max)

function number = n_uniform2
%% INIZZIALIZZAZIONI
    number = 1;
    n_random = rand;
    
%% CICLO CONTEGGIO NUMBER
    while ~(n_random < 0.85 && n_random > 0.8)
            n_random = rand;
            number = number + 1;
    end
end