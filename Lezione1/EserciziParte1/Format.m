%  *** ANDREA CASTRONOVO  14/12/2020 ***
%% ES.1: Si creino due variabili 'var1', 'var2' con valore qualsisasi e si 
% visualizzi il loro valore nei diversi formati a disposizione.

var1 = pi;
var2 = - 3428517899;

%%  SHORT (default), 4 valori decimali

disp("Format short, 4 valori decimali!");
var1
var2

%%  LONG, 15 valori decimali

disp("Format long, 15 valori decimali!");
format long

var1
var2

%%  SHORT E, 4 valori decimali e notazione esponenziale

disp("Format shortE, 4 valori decimali e notazione esponenziale!");
format shortE

var1
var2

%%  LONG E, 15 valori decimali e notazione esponenziale

disp("Format longE, 15 valori decimali e notazione esponenziale!");
format longE

var1
var2

%%  SHORT G, la più compatta tra short e shortE

disp("Format shortG, la più compatta tra short e shortE!");
format shortG

var1
var2

%%  LONG G, la più compatta tra long e longE

disp("Format longG, la più compatta tra long e longE!");
format longG

var1
var2

%%  SHORT ENG, shortE con esponente multiplo di 3

disp("Format shortEng, shortE con esponente multiplo di 3!");
format shortEng

var1
var2

%%  LONG ENG, longE con esponente multiplo di 3

disp("Format longEng, longE con esponente multiplo di 3!");
format longEng

var1
var2

%%  BANK, 2 valori decimali

disp("Format bank, 2 valori decimali!");
format bank

var1
var2

%%  RAT, frazione più vicina

disp("Format rat, frazione più vicina!");
format rat

var1
var2

%%  +, segno

disp("Format +, segno!");
format +

var1
var2

%%  HEX, esadecimale

disp("Format hex, esadecimale!");
format hex

var1
var2

format short %Reset Default