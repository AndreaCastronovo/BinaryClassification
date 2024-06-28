%   ANDREA CASTRONOVO 22/12/2020

%% Si generi una sequenza di numeri binari di lunghezza N e se ne 
%  calcolino il valore medio e la varianza per N = 10,100,1000,10000.

%% -----------------------------------------------------------------------

%Stato iniziale
    s = rng;
    
 %% 10
 
    N = 10;
    disp("Sequenza con N = " + N);
    bin_sequency = randi([0,1],1,N);
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 100
    
    rng(s);
    N = 100;
    disp("Sequenza con N = " + N);
    bin_sequency = randi([0,1],1,N);
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 1'000
 
    rng(s);
    N = 1e3;
    disp("Sequenza con N = " + N);
    bin_sequency = randi([0,1],1,N);
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 10'000
 
    rng(s);
    N = 1e4;
    disp("Sequenza con N = " + N);
    bin_sequency = randi([0,1],1,N);
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
    