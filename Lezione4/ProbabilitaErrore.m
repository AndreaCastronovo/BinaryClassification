%% ------------------- SIMULAZIONE NUMERICA ------------------------------
%                          15/10/2020
%                   CALCOLO PROBABILITA' D'ERRORE

%% -----------------------------------------------------------------------

s = rng;
NT = 1e4;
b = randi([0,1],1,NT);
n = randn(1,NT);
r = b + n;

bhat = zeros(size(r));
bhat(r>=0) = 1;
bhat(r<0) = 0;

error = abs(b - bhat);

P_error = sum(error)/NT;