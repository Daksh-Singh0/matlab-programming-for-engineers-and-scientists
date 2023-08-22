function f = fibor(n)
if n == 1
    f = [1];
elseif n == 2
    f = [1 1];
else
    temp = [fibor(n-1)];
    f = [temp, temp(end)+temp(end-1)];
end