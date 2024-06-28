% ANDREA CASTRONOVO     19/12/2020
%
%% Funzione che stampa su Command Window tutti i numeri
%  primi fino a che non si raggiunga un numero di primi fornito dall’utente in
%  ingresso. Si verifichi il valore fornito in ingresso opportunamente.
%
%% primeNumber(n_max);      n_max = numero scalare positivo senza virgola.s

function primeNumber(n_max)

%% Verifichiamo n_max
    validateattributes(n_max,{'numeric'},{'scalar','>=',0});
    if n_max <=1
        warning("Non ci sono numeri primi.");
    elseif floor(n_max) ~= n_max
        warning("Numero con virgola, arrotondo per difetto.");
    end
    
%% Primes function of matlab
    primes(n_max)
    
end