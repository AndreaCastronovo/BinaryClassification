% ANDREA CASTRONOVO 18/12/2020

%% CLIENT FUNCTION
% Funzione che avente in ingresso matrice clienti, contenente il numero di
% monete possedute per persona, calcola: 
%   ◮ quanti soldi ha ogni persona;
%   ◮ il totale in monete di ogni valore;
%   ◮ la media dei soldi posseduti da ogni persona.
% salvando poi i risultati in un file client.mat

%% ------------------------------------------------------------------------

function [vector_money, vector_totClient, vector_averageClient ] ...
                                           = clients_survey(money, client)
    %% OPERAZIONI DI CALCOLO
    
    %Calcolo totale € per persona
        vector_totClient = sum(client .* money,2);
    %Calolo totale monete
        vector_money = sum(client,1);
    %Caclcolo media soldi posseduti da ogni persona
        vector_averageClient = vector_totClient/size(vector_totClient,1);
        
     %% SALVATAGGIO DI DATI
     
        folder = 'C:\Users\andre\Documents\MATLAB\EserciziParte3\OutputFolder';
        save (fullfile(folder, 'client.mat')...
                   ,'vector_money', 'vector_totClient', 'vector_averageClient');

end