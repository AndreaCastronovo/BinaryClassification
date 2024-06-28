%   ANDREA CASTRONOVO   16/12/2020

%% EXPERIMENT OF THROWING DICE

 numero_Lanci = 1e7;
 lanci = randi(6, numero_Lanci, 1);

 histogram(lanci, 'Normalization', 'Probability') %Istogramma normalizzato alla probabilità

 tabulate(lanci) %Frequency of throwing
 
 % NUMBER OF RESULT MAJOR OR EQUAL OF 2
    disp("Number of result major or equal of 2: " + sum(lanci>=2)/numero_Lanci);
 