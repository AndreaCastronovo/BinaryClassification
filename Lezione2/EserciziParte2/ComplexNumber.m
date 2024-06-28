%  *** ANDREA CASTRONOVO  01/10/2020 ***

%% CREAZIONE SCRIPT PER IL CALCOLO DI MODULO E FASE (RADIANTI E GRADI)
%   DI DUE NUMERI COMPLESSI ------------------------------------------ 

%% Generazione casuale dei numeri complessi e uso della funzione mod e fase
complex_value1 = randn + 1i*randn;
complex_value2 = randn + 1i*randn;

[mod1, phase1, mod2, phase2] = Mod_Phase(complex_value1, complex_value2);

%% Da radianti a gradi
phase1_degrees = rad2deg(phase1);
phase2_degrees = rad2deg(phase2);

fprintf("Phase of complex number 1, in radiant is: %3.4f \n", phase1);
fprintf("Phase of complex number 1, in degrees is: %3.4f \n", phase1_degrees);
fprintf("Phase of complex number 2, in radiant is: %3.4f \n", phase2);
fprintf("Phase of complex number 2, in degrees is: %3.4f \n", phase2_degrees);

%% Salvataggio dati
folder = 'C:\Users\andre\Documents\MATLAB\Lezione2\EserciziParte2\OutputFolder';
save (fullfile(folder, 'My_workspace.mat'));