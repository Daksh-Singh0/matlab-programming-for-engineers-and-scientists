function v = reversal(v)
    if length(v) > 1
        mid = ceil(length(v)/2);
        
        if mod(length(v), 2) == 1
            v = [reversal(v(mid+1:end)) v(mid) reversal(v(1:mid-1))];
        else
            v = [reversal(v(mid+1:end)) reversal(v(1:mid))];
        end
    end
end