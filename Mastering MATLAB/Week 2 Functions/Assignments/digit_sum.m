function output = digit_sum(num)
if num < 10
    output = num;
    return
else
    output = mod(num, 10) + digit_sum(fix(num/10)); 
end