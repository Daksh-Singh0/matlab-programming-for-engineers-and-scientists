function [f, trace] = fibo_trace(n, v)
    if n <= 2
        f = 1;
        trace = n;
    else
        [f1, trace1] = fibo_trace(n-2, v);
        [f2, trace2] = fibo_trace(n-1, v);
        f = f1 + f2;
        trace = [n trace1 trace2];
    end
end