function output = palindrome(str)
if length(str) < 2
    output = true;
else
    output = str(1) == str(end) && palindrome(str(2:end-1));
end