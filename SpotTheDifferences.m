pkg load image
clear all;

original = imread('C:\...\');
edited = imread('C:\...\');

figure
subplot(1, 2, 1);
imshow(original);
title('Original Picture', 'fontsize', 16);
subplot(1, 2, 2);
imshow(edited);
title('Edited Picture', 'fontsize', 16);

BW = abs( double(original) - double(edited) );
filter1 = not(im2bw(BW));
filter2 = bwperim(filter1);
filter3 = bwareaopen(filter2, 50);
filter4 = bwmorph(filter3, 'close');
spots = bwmorph(filter4, 'thicken', 2);

imgRgb(:,:,1) = original;
imgRgb(:,:,2) = original;
imgRgb(:,:,3) = original;
imgRgb = imgRgb .* not(spots);
imgRgb(:,:,1) = imgRgb(:,:,1) + 255*spots;
figure
imshow(imgRgb);
