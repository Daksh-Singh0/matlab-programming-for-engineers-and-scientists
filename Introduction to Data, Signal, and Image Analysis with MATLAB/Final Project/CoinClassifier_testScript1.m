% Define the filter size we will use in step 2:
filtsize = 85;

% Creating test image 'im' by splicing together two built in images.
% Also zero-padding (adding zeros around the border) with half the
% filter size (filtsize) we will use so that the filter could be
% centered on any actual image pixel, including those near the border.
% 'coins.png' contains bright nickels and dimes on a dark background
% 'eight.tif' contains dark quarters on a bright background, so we invert it
% to match 'coins.png'
im1 = imread('coins.png');
[r,c] = size(im1);
im2 = imread('eight.tif');
[r2,c2] = size(im2);
filtsizeh = floor(filtsize/2);
im = zeros(r+r2+filtsize,c+filtsize);
im(filtsizeh+1:filtsizeh+r+r2,filtsizeh+1:filtsizeh+c) = [im1;255-im2(:,1:c)];
[r,c] = size(im);
imagesc(im);colormap(gray);title('test image');axis equal;

% Initializing assessed/displayed variables as empty so that code is executable
msk=[]; msk_dil=[]; msk_dil_erd=[]; centroid=[]; component_size=[];

%%%%% 1. Localize the centroid of each coin
% Otsu threshold
[msk, thrsh] = OtsuThreshold(im);
figure; imagesc(msk); colormap(gray); title('Otsu'); axis equal;

% Dilate
msk_dil = imdilate(msk, ones(3, 3));
figure; imagesc(msk_dil); colormap(gray); title('Dilated'); axis equal;

% Erode
msk_dil_erd = imerode(msk_dil, ones(6, 6));
figure; imagesc(msk_dil_erd); colormap(gray); title('Eroded'); axis equal;

% Connected components to get centroids of coins:
stats = regionprops("table", msk_dil_erd, "Centroid", "MajorAxisLength","MinorAxisLength");
centroid = stats.Centroid;
radii = mean([stats.MajorAxisLength stats.MinorAxisLength],2)/2;
component_size = round(pi.*radii.^2);

for i=1:size(centroid, 1)
    for j=1:size(centroid, 2)
        if mod(centroid(i, j), 1) >= 0.5
            centroid(i,j) = floor(centroid(i,j));
        else
            centroid(i,j) = ceil(centroid(i,j));
        end
    end
end
centroid
component_size


%%%%%%%%%%%%%%%%%%%% Helper Functions %%%%%%%%%%%%%%%%%%%%%
function [msk,thrsh] = OtsuThreshold(img)
% Define the Otsu threshold 'thrsh' using the histogram of img
hst = imhist(img);
thrsh = otsuthresh(hst)*255;
% Apply the threshold to 'img' to make 'msk'
msk = img > thrsh;
end
