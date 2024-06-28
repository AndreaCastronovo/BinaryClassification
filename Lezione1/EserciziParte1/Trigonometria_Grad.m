%  *** ANDREA CASTRONOVO  14/12/2020 ***
%% ES.5 Si calcolino i risultati per almeno 2 angoli noti delle seguenti
% funzioni trigonometriche: cos, sin, acos, asin, tan, atan, cot, acot

Angle_1 = rad2deg(pi);
Angle_2 = rad2deg(2 * pi); %angoli in gradi

%% COSENO
fprintf(" cos(%4.4f) = %2.4f \n", Angle_1, cosd(Angle_1));
fprintf(" cos(%4.4f) = %2.4f \n", Angle_2, cosd(Angle_2));

%% SENO
fprintf(" sin(%4.4f) = %2.4f \n", Angle_1, sind(Angle_1));
fprintf(" sin(%4.4f) = %2.4f \n", Angle_2, sind(Angle_2));

%% ARCOSENO
fprintf(" acos(%4.4f) = %2.4f \n", Angle_1, acosd(Angle_1));
fprintf(" acos(%4.4f) = %2.4f \n", Angle_2, acosd(Angle_2));

%% ASENO
fprintf(" asin(%4.4f) = %2.4f \n", Angle_1, asind(Angle_1));
fprintf(" asin(%4.4f) = %2.4f \n", Angle_2, asind(Angle_2));

%% TANGENTE
fprintf(" tan(%4.4f) = %2.4f \n", Angle_1, tand(Angle_1));
fprintf(" tan(%4.4f) = %2.4f \n", Angle_2, tand(Angle_2));

%% ARCOTANGENTE
fprintf(" atan(%4.4f) = %2.4f \n", Angle_1, atand(Angle_1));
fprintf(" atan(%4.4f) = %2.4f \n", Angle_2, atand(Angle_2));

%% COTANGENTE
fprintf(" cotan(%4.4f) = %2.4f \n", Angle_1, cotd(Angle_1));
fprintf(" cotan(%4.4f) = %2.4f \n", Angle_2, cotd(Angle_2));

%% ARCOCOTANGETE
fprintf(" acotan(%4.4f) = %2.4f \n", Angle_1, acotd(Angle_1));
fprintf(" acotan(%4.4f) = %2.4f \n", Angle_2, acotd(Angle_2));

