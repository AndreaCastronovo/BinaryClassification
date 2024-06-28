% ANDREA CASTRONOVO     18/12/2020

%%  TEMPERATURE CONVERTER

% Funzione di conversione temperatura da Centigradi a Fahrenheit e Kelvin

%% ----------------------------------------------------------------------

function [t_kelvin, t_farh] = Centig2Kelv_Farh(t_centig)

%Zero assoluto
    if(t_centig < -273.15)
        warning('The input temperature cannot be lower than the absolute zero. Fixed to 0 C.')
        t_centig = 0;
    end

%Gradi Kelvin
    t_kelvin = 273.15 + t_centig;
%Gradi Farhenait
    t_farh = t_centig * 9/5 + 32;
end