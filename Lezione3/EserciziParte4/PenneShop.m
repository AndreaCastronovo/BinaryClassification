% ANDREA CASTRONOVO     19/12/2020
%
%%  Si scriva uno script che richiede all’utente di inserire il numero di
%   penne da comprare su Command Window. In base al numero inserito, i
%   seguenti prezzi vanno applicati:
%       - fino a 20 penne, 1 euro a penna
%       - da 21 a 40 penne, 0.95 euro a penna
%       - da 41 a 60 penne, 0.90 euro a penna
%       - da 61 a 100 penne, 0.85 euro a penna
%   Valori superiori a 100 devono essere segnalati come errore o come
%   warning (fissando il numero di penne al massimo consentito). 
%
%   Nota: si controlli la documentazione delle funzioni warning ed error.

%% INFO SHOP

clear

disp("BENVENUTO ALLO SHOP");
disp("In base al numero di penne che si vuole acquistare verranno applicati i seguenti prezzi: ");
disp("- fino a 20 penne, 1€ a penna");
disp("- da 21 a 40 penne, 0.95€ a penna");
disp("- da 41 a 60 penne, 0.90€ euro a penna");
disp("- da 61 a 100 penne, 0.85€ euro a penna");
disp("");

%% CICLO INPUT

%Flag di ciclo
    flag = 1;

while flag
    
    n_penne = input("Inserisci il numero di penne che vuoi acquistare: ");
    %% VERIFICO CORRETTO INSERIMENTO
    
    % Verifico numero scalare positivo
    try 
        validateattributes(n_penne,{'numeric'},{'scalar','positive'});
    catch ME
        disp(ME.message);
    end
    % Se presente virgola
    alredy_exist = exist('ME');
    if ~alredy_exist
        if floor(n_penne) ~= n_penne
            warning("Numero non intero, perfavore reinserisci.");
        else
            flag = 0;
        end
    end
    clear ME;
end

%% CALCOLO PREZZO

    if n_penne<=20
        price_penne = 1;
    elseif n_penne>20 && n_penne<=40
        price_penne = 0.95;
    elseif n_penne>40 && n_penne<=60
        price_penne = 0.90;
    elseif n_penne>60 && n_penne<=100
        price_penne = 0.85;
    else
        %Se numero penne maggiore di 100
        warning("Purtroppo non possiedo più di 100 penne!");
        disp("Procedere comunque con l'acquisto di 100 penne?");
        continue_flag = input("Se NON vuoi procedere digita 0 o premi INVIO: ");
        if continue_flag
            %Se vuole procedere
            price_penne = 0.85;
        else
            flag = 1;
        end
    end
    
    %Prezzo tot
    if ~flag
        disp("Prezzo totale [€]: " + n_penne*price_penne);
    end
    
    disp("Arrivederci e grazie");
            
        
    