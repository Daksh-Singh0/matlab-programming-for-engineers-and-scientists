function mx = recursive_max(vec)
if length(vec) == 1
    mx = vec(1);
else
    result = recursive_max(vec(2:end));
    if result > vec(1)
        mx = result;
    else
        mx = vec(1);
    end
end