%   ANDREA CASTRONOVO 24/12/2020

%% Si ripeta l’esercizio 1 utilizzando una sequenza pseudo-casuale 
%  gaussiana con valor medio µn = 2 e varianza N0 = 9.

%% -----------------------------------------------------------------------

%Stato iniziale
    s = rng;
%Valor medio e varianza
    m = 2;
    v = 9;
    
 %% 10
 
    N = 10;
    disp("Sequenza con N = " + N);
    %Generazione sequenza gaussiana
    x = randn(1,N);
   %Varianza
    if var(x) ~= 1
        %Normalizzazione varianza
        x = (1/sqrt(var(x)))*x;
    end
    %Modifica varianza
    x = sqrt(v) * x;
   %Valor medio
    if mean(x)
        %Normalizzazione valor medio
        x = x - mean(x);
    end
    %Modifica valor medio
    x = m + x;
    %Verifica
    disp("Valor medio della sequenza gaussiana: " + mean(x));
    disp("Varianza della sequenza gaussiana: " + var(x));
    bin_sequency = zeros(size(x));
    %Generazione sequenza binaria
    bin_sequency(x<0) = -1;
    bin_sequency(x>=0) = 1;
    %Valor medio e varianza
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 100
    
    rng(s);
    N = 100;
    disp("Sequenza con N = " + N);
    %Generazione sequenza gaussiana
    x = randn(1,N);
   %Varianza
    if var(x) ~= 1
        %Normalizzazione varianza
        x = (1/sqrt(var(x)))*x;
    end
    %Modifica varianza
    x = sqrt(v) * x;
   %Valor medio
    if mean(x)
        %Normalizzazione valor medio
        x = x - mean(x);
    end
    %Modifica valor medio
    x = m + x;
    %Verifica
    disp("Valor medio della sequenza gaussiana: " + mean(x));
    disp("Varianza della sequenza gaussiana: " + var(x));
    bin_sequency = zeros(size(x));
    %Generazione sequenza binaria
    bin_sequency(x<0) = -1;
    bin_sequency(x>=0) = 1;
    %Valor medio e varianza
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 1'000
 
    rng(s);
    N = 1e3;
    disp("Sequenza con N = " + N);
    %Generazione sequenza gaussiana
    x = randn(1,N);
   %Varianza
    if var(x) ~= 1
        %Normalizzazione varianza
        x = (1/sqrt(var(x)))*x;
    end
    %Modifica varianza
    x = sqrt(v) * x;
   %Valor medio
    if mean(x)
        %Normalizzazione valor medio
        x = x - mean(x);
    end
    %Modifica valor medio
    x = m + x;
    %Verifica
    disp("Valor medio della sequenza gaussiana: " + mean(x));
    disp("Varianza della sequenza gaussiana: " + var(x));
    bin_sequency = zeros(size(x));
    %Generazione sequenza binaria
    bin_sequency(x<0) = -1;
    bin_sequency(x>=0) = 1;
    %Valor medio e varianza
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    
 %% 10'000
 
    rng(s);
    N = 1e4;
    disp("Sequenza con N = " + N);
    %Generazione sequenza gaussiana
    x = randn(1,N);
   %Varianza
    if var(x) ~= 1
        %Normalizzazione varianza
        x = (1/sqrt(var(x)))*x;
    end
    %Modifica varianza
    x = sqrt(v) * x;
   %Valor medio
    if mean(x)
        %Normalizzazione valor medio
        x = x - mean(x);
    end
    %Modifica valor medio
    x = m + x;
    %Verifica
    disp("Valor medio della sequenza gaussiana: " + mean(x));
    disp("Varianza della sequenza gaussiana: " + var(x));
    bin_sequency = zeros(size(x));
    %Generazione sequenza binaria
    bin_sequency(x<0) = -1;
    bin_sequency(x>=0) = 1;
    %Valor medio e varianza
    disp("Valor medio: " + mean(bin_sequency));
    disp("Varianza: " + var(bin_sequency));
    