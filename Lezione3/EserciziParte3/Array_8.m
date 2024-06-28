% ANDREA CASTRONOVO 18/12/2020

%% Si crei una matrice dove ogni riga rappresenta una persona e le colonne
% rappresentano il numero di monete da 2, 1, 0.50 , 0.20 e 0.10 euro che
% la persona possiede. Viene chiesto di scrivere uno script che, definita la
% matrice:
%  ◮ permetta di calcolare quanti soldi ha ogni persona
%  ◮ permetta di calcolare il totale in monete di ogni valore
%  ◮ di calcolare la media dei soldi posseduti da ogni persona
% Si ripeta l’esercizio trasformando lo script in una funzione e facendo
% salvare i 3 risultati ottenuti.

%% ------------------------------------------------------------------------

    %Array valore monete e array clienti
        moneys = [2.00, 1.00, 0.50, 0.20, 0.10];
        n_client = 1e3;
        clients = randi(1e2,n_client,5);
        
    %Richiamo funzione calcolo ricerca
        [vector_moneys, vector_totClients, vector_averageClients ] ...
                                         = clients_survey(moneys, clients);
 
    