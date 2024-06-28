% ANDREA CASTRONOVO     18/12/2020

%% Data una coppia di array ad una dimensione, si utilizzi il primo come
% vettore di pesi e il secondo come vettore di valori. Si calcoli la media
% pesata confrontando un approccio tramite ciclo e uno compatto con
% operazioni matriciali in termini di tempo di esecuzione.
%% -----------------------------------------------------------------------

%Coppia array
    dim = 1e3;
    weights = randi(100,dim);
    values  = randi(100,dim);
    
%% APPROCCIO TRAMITE CICLO SENZA PRE-ALLOCAZIONE

tic
for ii = 1:1:dim
    for jj = 1:1:dim
        average_NotAlloc_for(ii,jj) = weights(ii,jj)*values(ii,jj)/(dim^2);
    end
end
t_NotAlloc_for = toc

%% APPROCCIO TRAMITE CICLO CON PRE-ALLOCAZIONE

average_for = ones(dim);
tic
for ii = 1:1:dim
    for jj = 1:1:dim
        average_for(ii,jj) = weights(ii,jj)*values(ii,jj)/(dim^2);
    end
end
t_for = toc

%% APPROCCIO TRAMITE OPERAZIONI MATRICIALI

tic
    average = (weights .* values)/(dim^2);
t_matrix = toc
