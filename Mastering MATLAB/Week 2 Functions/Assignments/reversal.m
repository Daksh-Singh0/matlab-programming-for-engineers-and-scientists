function output = reversal(v)
if length(v) == 1
    output = v;
else
   output = [v(end) reversal(v(1:end-1))];
end