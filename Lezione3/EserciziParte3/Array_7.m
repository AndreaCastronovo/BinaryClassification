%% *** ANDREA CASTRONOVO 25/10/2020 ***

%% Si chieda all’utente di fornire una stringa in ingresso. Si fornisca in
% uscita la stringa ordinata in ordine alfabetico (“hello” deve diventare
% “ehllo”). Numeri o punteggiatura devono venire cancellati dalla stringa.
% Si aggiunga, dopo un test, la possibilità di eliminare gli spazi.

%% ******************** CODICE PIU LUNGO *********************************
% 
% %Inserimento stringa da utente
% str = input("Inserisci una stringa: ", 's');
% %Array of pattern that want be erase
% Pattern = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", " ", ...
%     ".", ",", ";", ":", "!", "?"];
% 
% str_Alphabetic = strip(sort(str),'left');
% disp("La stringa in ordine alfabetico: " + str_Alphabetic);
% str_Alphabetic_Erase = erase(str_Alphabetic, Pattern);
% disp("La stringa senza numeri, spazi e punteggiatura: " + str_Alphabetic_Erase );

%% ******************** CODICE SEMPLIFICATO ******************************

%Inserimento stringa da utente
str = input("Inserisci una stringa: ", 's');
space_flag = input("Desideri gli spazi? [0/1]");

%Richiamo funzione per riscrittura stringa
new_str = str_Alpha_FlagSpace(str,space_flag);

disp("La stringa senza numeri, punteggiatura e spazi (se richiesto): " + new_str);
disp("La stringa riordinata in ordine alfabetico: " + strip(sort(new_str)),'left');












