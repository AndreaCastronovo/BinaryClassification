%% ------------------- SIMULAZIONE NUMERICA ------------------------------
%                          15/10/2020
%                   GENERATORE DI NUMERI CASUALI

%% rand();

%Numeri pseudo-casuali dallo rng-motor, vettori differenti
    %Salvataggio stato attuale
    s1 = rng;
    vector_uniformedRandom1 = rand(1,4)
    %Salvataggio stato attuale
    s2 = rng;
    vector_uniformedRandom2 = rand(1,4)

%Generazione nuovo vettore ma uguali ai precedente
    %Richiamo settaggio iniziale
    rng(s1);
    vector_uniformedRandom3 = rand(1,4)
    if vector_uniformedRandom1 == vector_uniformedRandom3
        disp("Vettori identici: E' IMPORTANTE SALVARE IL SETTAGGIO INIZIALE PER POTER RIPETERE CORRETTAMENTE L'ESPERIMENTO!");
    end
    rng(s2);
    vector_uniformedRandom4 = rand(1,4)
    if vector_uniformedRandom2 == vector_uniformedRandom4
        disp("Vettori identici: E' IMPORTANTE SALVARE IL SETTAGGIO INIZIALE PER POTER RIPETERE CORRETTAMENTE L'ESPERIMENTO!");
    end
    
%Essendo una sequenza posso omettere il richiamo del secondo settaggio
    rng(s1);
    vector_uniformedRandom3 = rand(1,4)
    vector_uniformedRandom4 = rand(1,4)
    
%% randi()

s = rng;
vector_intRandom1 = randi(5,1,8)
rng(s);
vector_intRandom2 = randi(5,1,20)

%% randn()

help randn

%Sequenza di numeri reali con distribuzione prossima a gaussiana, vmedio
%nullo e varianza unitaria
    s = rng;
    vector_gaussianRandom1 = randn(1,20);
    %Valor medio
    mean_gaussianRandom1 = mean(vector_gaussianRandom1)
    if mean_gaussianRandom1
        disp("Il valor medio non è zero, ma tende a stabilizzarsi con l'aumentare dei numeri di casi totali(20)! ");
    end
    %Varianza
    var_gaussianRandom1 = var(vector_gaussianRandom1)
    if var_gaussianRandom1 ~= 1
        disp("Stessa cosa per la varianza");
    end
    
    vector_gaussianRandom2 = randn(1,2000000);
    %Valor medio
    mean_gaussianRandom2 = mean(vector_gaussianRandom2)
    %Varianza
    var_gaussianRandom2 = var(vector_gaussianRandom2)


%Sequenza di numeri reali con distribuzione prossima a gaussiana, vmedio
%non nullo e varianza non unitaria

  %MEDIA
    %PRIMO CASO: sommo una quantita alla media
    m = 10;
    rng(s);
    z = m + randn(1,2000000);
    mean(z)
    %SECONDO CASO: MIGLIORE,sottraggo l'imperfezione e poi sommo il valor medio che
    %voglio ottenere
    rng(s);
    vect_gaussian = randn(1,2000000);
    vect_gaussian_mean = vect_gaussian - mean(vect_gaussian);%normalizzo il nuovo vettore a valori prossimi a 0
    mean(vect_gaussian_mean)
    z = m + vect_gaussian_mean;%Sommo m
    mean(z)
    
  %VARIANZA
    %PRIMO CASO: moltiplico per la deviazione standard della varianza che voglio ottenere
    rng(s);
    z = randn(1,2000000);
    var(z)
    sigma2 = 10;
    z = sqrt(sigma2) * z;
    var(z)
 
%Sequenza di numeri reali con distribuzione prossima a gaussiana, vmedio
%non nullo e varianza unitaria normalizzata.

    z = randn(1,2000000);
    sigma2 = var(z)
    %Normalizzazione della varianza
    z = (1/sqrt(sigma2))*z;
    var(z)
 
    