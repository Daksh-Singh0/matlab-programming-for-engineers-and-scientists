function [a, b] = lin_reg(x,y)
M = [x; ones(1, length(x))]';
result = M\y';
a = result(1);
b = result(2);
end