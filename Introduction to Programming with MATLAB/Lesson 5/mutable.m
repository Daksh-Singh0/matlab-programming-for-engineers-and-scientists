function [table summa] = mutable(n, m)

if nargin < 2
    m = n;
end

table = (1:n)' * (1:m);

if nargout == 2
    summa = sum(table(:));
end