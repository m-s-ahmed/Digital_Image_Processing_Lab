clc;
clear;
close all;

% Read the image
image = imread('IMG-20220420-WA0000.jpg'); % Replace with your image file

% Convert to grayscale if it's a color image
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Get the size of the image
[m, n] = size(image);

% Define a 3x3 averaging filter
filter = ones(3, 3) / 9;  

% Initialize output image
smoothed_image = zeros(m, n);

% Apply the filter manually
for i = 2:m-1
    for j = 2:n-1
        % Extract the 3x3 region
        region = double(image(i-1:i+1, j-1:j+1));
        
        % Perform element-wise multiplication and sum
        smoothed_value = sum(sum(region .* filter));
        
        % Assign new value to the output image
        smoothed_image(i, j) = smoothed_value;
    end
end

% Convert back to uint8
smoothed_image = uint8(smoothed_image);

% Display the results
figure;
subplot(1,2,1);
imshow(image);
title('Original Image');

subplot(1,2,2);
imshow(smoothed_image);
title('Smoothed Image');