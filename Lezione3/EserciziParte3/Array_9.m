% ANDREA CASTRONOVO     18/12/2020

%% Si scriva una funzione che, data in ingresso la temperatura in gradi
% centigradi, la converta sia in Fahrenheit sia in Kelvin. Si scriva poi uno
% script che, dato un range di temperature e lo step, fornisca un array
% dove la prima colonna rappresenta le temperature in gradi Celsius, la
% seconda in Fahrenheit e la terza in Kelvin.

%% -----------------------------------------------------------------------

%%  INPUT

    %Range di temperature
    min_t = input("Inserire temperatura [C] minima: ");
    max_t = input("Inserire temperatura [C] massima: ");
    
    %Step
    step = input("Forniscimi lo step di variazione temp.: ");
    
%%  ARRAY TEMPERATURE
    
    %Creo vettore temperature centigradi
    vector_Tcentig = min_t:step:max_t;
    %Uso la funzione per ricavare le altre
    [vector_Tkelvin, vector_Tfarh] = Centig2Kelv_Farh(vector_Tcentig');
    %Array di temperature come richiesto
    temperature = [vector_Tcentig', vector_Tfarh, vector_Tkelvin];
    