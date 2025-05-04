clc;
clear;

% Step 1: Read the image
img = imread('img3.jpg'); % RGB image

% Step 2: Manually convert to grayscale
[rows, cols, ch] = size(img);
gray_img = zeros(rows, cols);   % Empty grayscale image

for i = 1:rows
    for j = 1:cols
        R = img(i,j,1);
        G = img(i,j,2);
        B = img(i,j,3);
        gray_img(i,j) = 0.2989*R + 0.5870*G + 0.1140*B;
    end
end

% Step 3: Apply log transformation manually
log_img = zeros(rows, cols);     % Empty image for log transform

max_val = max(gray_img(:));      % Maximum grayscale intensity
c = 255 / log(1 + max_val);      % Scaling constant

%এই লাইনটি scaling constant c নির্ধারণ করে, 
% যাতে log transform করার পর pixel value-গুলো 0 থেকে 255 এর মধ্যে থাকে।

for i = 1:rows
    for j = 1:cols
        log_img(i,j) = c * log(1 + gray_img(i,j));   % Manual log transform
        
        %Log function এর output অনেক সময় 255 এর নিচে বা ওপরে চলে যায়, 
        % তাই আমরা result কে normalize করার জন্য c ব্যবহার করি।

    end
end

% Step 4: Convert to uint8
gray_img = uint8(gray_img);
log_img = uint8(log_img);

% Step 5: Display results manually
figure;
subplot(1,2,1);
imshow(gray_img)
%image(gray_img);
%colormap(gray(256));
axis off;
title('Original Grayscale Image');

subplot(1,2,2);
imshow(log_img)
%image(log_img);
%colormap(gray(256));
axis off;
title('Log Transformed Image');
