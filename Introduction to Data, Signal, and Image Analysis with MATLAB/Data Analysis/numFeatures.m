load humact.mat
D = feat; % [24075 x 60] matrix containing 60 feature measurements from 24075 samples
% compute eigvals
[eigvects, D_pca, eigvals] = pca(D);
% compute the cumulative_percent_variance_permode vector. 
cumulative_percent_variance_permode = cumsum(100 * eigvals/sum(eigvals));
% Define N as the number of eigenvectors needed to capture at least 99.9% of the variation in D. 
N = find(cumulative_percent_variance_permode >= 99.9, 1);