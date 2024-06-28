% ANDREA CASTRONOVO     19/12/2020
%
%% Funzione che, dato un valore intero massimo fornito dall’utente,
%  fornisce in uscita il numero di numeri casuali uniformi tra
%  0 e 1 che è stato necessario generare per ottenere una somma pari al
%  numero fornito.
%
%% number = n_uniform(n_int_max)

function number = n_uniform(n_int_max)
%% INIZZIALIZZAZIONI
    number = 2;
    n_random = rand + rand;
%% VERIFICA NUMERO INTERO
    validateattributes(n_int_max,{'numeric'},{'scalar','>',0});
    if isinf(n_int_max)
        error("Il numero deve essere finito.");
    end
        
    if floor(n_int_max) ~= n_int_max
        warning("Numero con virgola, arrotondo per difetto.");
        n_int_max = floor(n_int_max);
    end
        
%% CICLO CONTEGGIO NUMBER
    while n_random < n_int_max
            %Somma minore dell'intero
            n_random = n_random + rand;
            number = number + 1;
    end
end