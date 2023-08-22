function indices = saddle(M)
indices = [];
for row = 1:size(M, 1)
    max_value = max(M(row, :));
    for col = 1:size(M, 2)
        if M(row, col) == max_value && max_value == min(M(:, col))
            indices(end+1, :) = [row, col];
        end            
    end
end