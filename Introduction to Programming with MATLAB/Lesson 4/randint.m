function x = randint(n,m)
x = randi(n, m);
fprintf('The last element on the last row is %d.\n', x(n,m));