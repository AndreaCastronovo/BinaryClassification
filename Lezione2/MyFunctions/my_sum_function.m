%% Function that doing sum and avarage of 5 number.

%% FUNCTION

%Avarage function
function my_avg = my_sum_function(a, b, c, d, e)

my_sum = my_nested_sum(a, b, c, d, e);
my_avg = my_sum / 5;

end
                
%Sum function
function result = my_nested_sum(a1, b1, c1, d1, e1)

result = a1 + b1 + c1 + d1 + e1;

end