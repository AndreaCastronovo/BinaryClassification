%  *** ANDREA CASTRONOVO  01/10/2020 ***

%% Funzione che modulo e fase (in radianti) di due numeri complessi ------

function [mod1, phase1, mod2, phase2] = Mod_Phase(complex_value1, complex_value2)

mod1 = abs(complex_value1);
mod2 = abs(complex_value2);
phase1 = angle(complex_value1);
phase2 = angle(complex_value2);

end