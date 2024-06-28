%  ANDREA CASTRONOVO   16/12/2020

%% CONTROLLO DI FLUSSO CONDIZIONALE

 %IF-THEN
 d = 0.1:0.1:1e3;
 plot_flag = 0;
 
 if plot_flag
     
     plot(d,'--*m')
     
 end
 
 %IF-THEN-ELSE
 if plot_flag
     
     plot(d,'--*m')
     
 else
     
     disp('Nessun grafico richiesto!');
 
 end
 
 %SWITCH-CASE
 switch plot_flag
     case 1
         plot(d,'--*m')
     case 0
         disp('Nessun grafico richiesto!')
     otherwise
         disp('Parametro non riconosciuto.')
 end
 
 %TRY-CATCH
 A = ones(3,4);
 B = A;
 
 try
     C = A * B;
 catch ME %variabile per salvare l'errore eventuale
     disp("Errore di esecuzione.");
 end
 
%% CONTROLLO DI FLUSSO CICLICHE
 
 %FOR
 A2 = zeros(10);
 
 for ii = 1:1:size(A2,1)
     for jj = 1:1:size(A2,2)
         
         A2(ii,jj) = rand;
         
         %Interruzione se l'ultimo valore è maggiore di 0.7
         if A2(ii,jj)>0.7
             break
         end
         
     end
 end

 %WHILE
 x = rand;
 counter = 1;
 
 while x < 0.7
     counter = counter + 1;
     x = rand;
 end
 