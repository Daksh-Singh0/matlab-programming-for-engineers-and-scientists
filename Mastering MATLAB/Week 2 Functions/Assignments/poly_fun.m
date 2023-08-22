function pf = poly_fun(p)
    function polynomial = poly(x)
        polynomial = sum(p .* x .^ [0:length(p)-1]);
    end    
    pf = @poly;
end