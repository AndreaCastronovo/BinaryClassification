%  ANDREA CASTRONOVO  18/12/2020
%
%% FREE SPACE LOSS [dB] FUNCTION
%
%% Funzione che, data una frequenza e una distanza [km] in ingresso,
%  calcola l’attenuazione di spazio libero in dB.
%
%  fsl_dB = Free_Space_Loss_dB(freq,dist_km)
%
%% ----------------------------------------------------------------------

function fsl_dB = Free_Space_Loss_dB(freq,dist_km)
    %Formula di attenuazione spazio libero
        fsl_dB = 32.45 + 20*log10(dist_km) + 20*log10(freq);
end