% ANDREA CASTRONOVO     19/12/2020
%
%%    Si scriva uno script che, dato un vettore di qualsiasi lunghezza fornito
%     dall’utente, mostri il grafico della running sum in funzione dell’indice.
%     Nota: la running sum nell’elemento j-esimo è la somma di tutti gli
%     elementi precedenti e del j-esimo.
%
%% -----------------------------------------------------------------------

%% INPUT
    vect_in = input("Inserisci un vettore: ");
    index = 1:1:numel(vect_in);
%% CICLO
    running_sum = ones([1,numel(vect_in)]);
    for ii = 1:1:numel(vect_in)
        running_sum(ii) = sum(vect_in(ii));
    end
    
%% PLOT
    plot(index,running_sum)
    xlabel('Indice')
    ylabel('RunningSum')