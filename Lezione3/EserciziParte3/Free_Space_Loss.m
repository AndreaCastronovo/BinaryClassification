%   ANDREA CASTRONOVO  18/12/2020

%% FREE SPACE LOSS FUNCTION

%% Funzione che, data una frequenza e una distanza [km] in ingresso,
%  calcola l’attenuazione di spazio libero.

%% ----------------------------------------------------------------------

function fsl = Free_Space_Loss(freq,dist_km)
    %Costante velocità della luce
        c   = 299792458;
    %Formula di attenuazione spazio libero
        fsl = (4*pi*dist_km*freq/c)^2;
end