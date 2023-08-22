function matrix = sparse2matrix(cellvec)
matrix = ones(cellvec{1, 1})*cellvec{1, 2};
for ii = 3:size(cellvec, 2)
    element = cellvec{1, ii};
    matrix(element(1), element(2)) = element(3);
end