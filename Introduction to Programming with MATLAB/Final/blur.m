function output = blur(img, w)
img_size = size(img);
output = zeros(img_size);
img = double(img);
for row = 1:img_size(1)
    for col = 1:img_size(2)
        avg_row = [row-w:row+w];
        avg_row = avg_row(0 < avg_row & avg_row <= img_size(1));
        avg_col = [col-w:col+w];
        avg_col = avg_col(0 < avg_col & avg_col <= img_size(2));
        avg_matrix = img(avg_row, avg_col);
        output(row, col) = mean(avg_matrix, "all");
    end
end

output = uint8(output);

