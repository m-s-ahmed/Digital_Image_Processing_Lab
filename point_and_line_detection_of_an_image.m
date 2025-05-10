clc;
clear;

% Step 1: Load grayscale image
%I = imread('cameraman.tif');% যদি না থাকে, অন্য grayscale নাও
I=imread('img3.jpg');
I=0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.1140*I(:,:,3);
I = double(I);  % কারণ আমরা গাণিতিক কাজ করবো

[m, n] = size(I);

% Step 2: Define Point Detection Kernel (Laplacian)
point_kernel = [0 -1 0; -1 4 -1; 0 -1 0];

% Step 3: Define Line Detection Kernels
line_horizontal = [-1 -1 -1; 2 2 2; -1 -1 -1];
line_vertical   = [-1 2 -1; -1 2 -1; -1 2 -1];

% Step 4: Padding image (to handle borders)
pad_size = 1;
padded_img = zeros(m + 2*pad_size, n + 2*pad_size);
padded_img(2:end-1, 2:end-1) = I;

% Step 5: Initialize result images
point_img = zeros(m, n);
line_h_img = zeros(m, n);
line_v_img = zeros(m, n);

% Step 6: Convolution manually
for i = 2 : m+1
    for j = 2 : n+1
        region = padded_img(i-1:i+1, j-1:j+1);
        
        % Point detection
        value1 = sum(sum(region .* point_kernel));
        point_img(i-1, j-1) = value1;

        % Horizontal line detection
        value2 = sum(sum(region .* line_horizontal));
        line_h_img(i-1, j-1) = value2;

        % Vertical line detection
        value3 = sum(sum(region .* line_vertical));
        line_v_img(i-1, j-1) = value3;
    end
end

% Step 7: Display the results
subplot(2,2,1); imshow(uint8(I)); title('Original Image');
subplot(2,2,2); imshow(uint8(abs(point_img))); title('Point Detection');
subplot(2,2,3); imshow(uint8(abs(line_h_img))); title('Horizontal Lines');
subplot(2,2,4); imshow(uint8(abs(line_v_img))); title('Vertical Lines');
