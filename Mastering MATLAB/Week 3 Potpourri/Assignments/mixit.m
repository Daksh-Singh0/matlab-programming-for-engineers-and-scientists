function output = mixit(A, M)
size_A = size(A);
output = zeros(size_A(1), 1);

for row = 1:size_A(1)
    scaled_A = double(A(row, :))*2/65535 - 1;
    output(row, 1) = dot(scaled_A, M);
end

max_output = max(abs(output));
if max_output > 1
    output = output/max_output;
end