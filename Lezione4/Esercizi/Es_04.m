%   ANDREA CASTRONOVO 24/12/2020

%% Si generi una sequenza pseudo-casuale gaussiana di lunghezza 
%  N = 1000 con valor medio µn = 0 e varianza N0 = 1,5,10.
%  Nei tre casi si disegnino l’istogramma (denista` di probabilita`) 
%  e la funzione probabilita` cumulativa.

%% -----------------------------------------------------------------------

%Salvataggio seed
 s = rng;
 NT = 1000;

%Varianza
 v = input("Inserisci varianza [1,5,10]: ");
%Creazione sequenza pseudo-casuale
 x = randn(1,NT);
%Normalizzo varianza
 x = x/sqrt(var(x));
 switch v
     case 1
     case 5
         x = sqrt(v) * x;
     case 10
         x = sqrt(v) * x;
     otherwise
         disp("Input errato, default v = 1");
         v = 1;
 end
 %Normalizzo valor medio
 x = x - mean(x);
 
%% HISTOGRAMMA
 histogram(x,'Normalization','probability')
 
%% PROBABILITA' CUMULATIVA
 pd = makedist('Normal');
 p = cdf(pd,x);
 plot(x,p)
 
%% ***********************************************************************
%  ***********************************************************************
%  ***********************************************************************

% Con riferimento all’esercizo precedente si calcolino numericamente 
% i valori della varianza e del 75mo, 85mo e 99mo percentile.

%% -----------------------------------------------------------------------

 var(x)

% 75mo
 x75 = x(1:1:end*75/100);
% 85mo
 x85 = x(1:1:end*85/100);
% 99mo
 x99 = x(1:1:end*99/100);











