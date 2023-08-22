function output = edgy(A)
sx_weights = [-1 0 1;-2 0 2; -1 0 1];
sy_weights = [1 2 1; 0 0 0; -1 -2 -1];

size_A = size(A);
output = zeros(size_A(1)-2, size_A(2)-2);

for row = 2:(size_A(1)-1)
    for col = 2:(size_A(2)-1)

        section = double(A(row-1:row+1, col-1:col+1));
        sx = double_dot_prod(sx_weights, section);
        sy = double_dot_prod(sy_weights, section);
        output(row-1, col-1) = sqrt(sx^2 + sy^2);
        
    end
end

output = uint8(output);

function result = double_dot_prod(M, N)
% M and N should be of the same size
size_M = size(M);
result = 0;

for row = 1:size_M(1)
    for col = 1:size_M(2)
        result = result + M(row, col) * N(row, col);
    end
end
        
