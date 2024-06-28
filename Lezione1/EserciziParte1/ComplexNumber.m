%  *** ANDREA CASTRONOVO  01/10/2020 ***

%% ES.2: Si creino due numeri complessi e si calcolino modulo e fase (gradi e radianti)

complex_value1 = randn + 1i*randn;
complex_value2 = randn + 1i*randn; %Generazione casuale dei numeri complessi

%% MODULO E FASE, calcolo del modulo e fase (in radianti)

mod1 = abs(complex_value1);
mod2 = abs(complex_value2);
phase1 = angle(complex_value1);
phase2 = angle(complex_value2);

%% Da radianti a gradi
phase1_degrees = rad2deg(phase1);
phase2_degrees = rad2deg(phase2);

fprintf("Phase of complex number 1, in radiant is: %3.4f \n", phase1);
fprintf("Phase of complex number 1, in degrees is: %3.4f \n", phase1_degrees);
fprintf("Phase of complex number 2, in radiant is: %3.4f \n", phase2);
fprintf("Phase of complex number 2, in degrees is: %3.4f \n", phase2_degrees);
