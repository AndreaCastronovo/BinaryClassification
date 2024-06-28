%  *** ANDREA CASTRONOVO  14/12/2020 ***
%% ES.2: Si testino i comandi di save, load , clear, e openvar,
% verificando anche le opzioni a disposizione nella documentazione.

A = pi * 15.5;
c = 'Andrea';
C = "Andrea";

disp('Contents of workspace: ');
whos;

%% SAVE & CLEAR

save('test.mat');
clear;

disp('Contents of workspace after clear: ');
whos;

%% LOAD

B = pi * 15.5;
d = 'Andrea';
D = "Andrea";

disp('Contents of workspace before loading file:');
whos;

load('Test.mat');

disp('Contents of workspace after loading file:');
whos;

%% OPENVAR, apre a livello visuale e in modo editabile la variabile selez.

openvar('D');
