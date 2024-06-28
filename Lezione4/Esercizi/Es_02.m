%   ANDREA CASTRONOVO 22/12/2020

%% Si generi una sequenza di numeri binari pseudocasuali incorrelati 
%  con Prob{0} = p e Prob{1} = 1 − p per i seguenti valori di p:
%     1. p = 0.1
%     2. p = 0.01
%     3. p = 0.001
%  Si verifichino sperimentalemente frequenze (rates) degli ”zero” 
%  e degli ”uno” indicando il numero NT di test effettuati nei tre casi

%% -----------------------------------------------------------------------

%Salvataggio stato iniziale
 s = rng;
%Dati iniziali
 NT = 1e4;
 x = rand(1,NT);
%Preallocazione
 bin_sequency = zeros(size(x));
 disp("Frequenze di 0 e 1 con NT = " + NT);
 
%%  P = 0.1
    prob = 0.1;
    %Seuquenza binaria
    bin_sequency_1(x<prob) = 0;
    bin_sequency_1(x>=prob) = 1;
    tabulate(bin_sequency_1)
    
%%  P = 0.01
    prob = 0.01;
    %Seuquenza binaria
    bin_sequency_01(x<prob) = 0;
    bin_sequency_01(x>=prob) = 1;
    tabulate(bin_sequency_01)
   
%%  P = 0.001
    prob = 0.001;
    %Sequenza binaria
    bin_sequency_001(x<prob) = 0;
    bin_sequency_001(x>=prob) = 1;
    tabulate(bin_sequency_001)
   
