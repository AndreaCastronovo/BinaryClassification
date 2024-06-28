% ANDREA CASTRONOVO 15/12/2020 ____ARRAY___

%% PRE_ALLOCATION

A = ones(1e3); %matrice a valori unitari di 1000 elementi
B = 3 * A;

    %%Versione inefficiente, ma corretta
    tic
    for ii = 1:1e3
        for jj = 1:1e3
            
            C(ii,jj) = A(ii,jj) * B(ii,jj);
            
        end
    end
    t1 = toc %Tempo di esecuzione
    
    %%Versione efficiente
    tic
    
    C = A.*B;
    
    t2 = toc
    
    %%Versione un po' più efficiente
    tic
    C = zeros(size(A));
    for ii = 1:1e3
        for jj = 1:1e3
            
            C(ii,jj) = A(ii,jj) * B(ii,jj);
            
        end
    end
    t3 = toc