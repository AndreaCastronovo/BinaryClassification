% ANDREA CASTRONOVO     19/12/2020
%
%%    Si scriva una funzione che fornisca in uscita il numero di numeri 
%     casuali uniformi tra 0 e 1 che è stato necessario generare per 
%     ottenere una media tra 0.01 e 0.3.
%
%% number = n_uniform3

function number = n_uniform3
%% INIZZIALIZZAZIONI
    number = 1;
    n_random_prec = rand;
    sum_n_random = n_random_prec;
    number_usati_sum = 1;
    
%% CICLO CONTEGGIO NUMBER
    while sum_n_random/number_usati_sum > 0.3
        %Prima volta Media maggiore di 0.3
            sum_n_random = rand;
            number = number + 1;
    end
    while sum_n_random/number_usati_sum < 0.01
            %Media minore di 0.01
                n_random_prec = rand;
                number = number + 1;
                number_usati_sum = number_usati_sum + 1;
                while (sum_n_random + n_random_prec)/number_usati_sum > 0.3
                    %Media maggiore di 0.3
                    n_random_prec = rand;
                    number = number + 1;
                end
                sum_n_random = sum_n_random + n_random_prec;
    end
end