% ANDREA CASTRONOVO     19/12/2020
%
%%  Funzione che, dato un vettore in ingresso, mostra il grafico
%   di una delle seguenti funzioni:
%     1 - y = x
%     2 - y = x^2
%     3 - y = x^3
%     4 - y = x^4
%   La scelta della funzione da graficare deve avvenire con un secondo
%   parametro in ingresso alla funzione.
%
%% grafic(vect_in, plot_flag);   plot_flag = from 1 to 4

function grafic(vect_in,plot_flag)

%% Plot_flag per plottare il grafico giusto
 validateattributes(plot_flag,{'numeric'},{'scalar','positive','<=',4});
 
%% Plot
 plot(vect_in,vect_in.^plot_flag);
 xlabel('x')
 ylabel('y')
 title(strcat('y = x^',num2str(plot_flag)))
 grid on
 
end
