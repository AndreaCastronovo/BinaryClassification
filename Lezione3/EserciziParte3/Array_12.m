%   ANDREA CASTRONOVO  18/12/2020

%% Si crei una funzione che, data una frequenza e una distanza in ingresso,
% calcoli l’attenuazione di spazio libero. Si utilizzi questa funzione in uno
% script per calcolare l’attenuazione per distanze tra 100 metri e un
% numero di km fornito dall’utente. Si mostri il grafico in funzione della
% distanza.

%% ----------------------------------------------------------------------

%%  INPUT
    
    %Frequenza
        freq = input("Inserisci la frequenza [Hz]: ");
    %Distanza
        dist_min = 0.1; %[km]
        dist_max = input("Inserisci la distanza massima [km]: ");
        dist = dist_min:0.1:dist_max;

    %Array di attenuazioni
        fsl_dB = Free_Space_Loss_dB(freq,dist);

%% GRAFICO
    
    plot(dist,fsl_dB,'*r')
    xlabel('Distance [km]')
    ylabel('Free space loss [dB]')
    grid on


