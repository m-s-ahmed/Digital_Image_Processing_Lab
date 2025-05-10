clc; 
clear;

% Step 1: Define original image (5x5)
img = [100 100 100 100 100;
       100 150 150 150 100;
       100 150 200 150 100;
       100 150 150 150 100;
       100 100 100 100 100];

% Step 2: Define sharpening kernel (3x3)
kernel = [ 0 -1  0;
          -1  5 -1;
           0 -1  0];

% Step 3: Get the size of the image and kernel
[m, n] = size(img);
[km, kn] = size(kernel);

% Step 4: Pad the original image to handle borders (1-pixel padding)
% Step 4: Pad the image with zero

pad_size = floor(km / 2);
padded_img = zeros(m + 2*pad_size, n + 2*pad_size);

% Copy the original image into the center of padded image
for i = 1:m
    for j = 1:n
        padded_img(i + pad_size, j + pad_size) = img(i, j);
    end
end

% Step 5: Create an output image matrix
sharpened_img = zeros(m, n);

%েহেতু padding-এর কারণে padded_img এর shape বড়, তাই মূল image-এর প ্সেলগুলো kernel এর সাথে align করার জন্য এই 
% offset (a-1, b-1) যোগ করা হচ্ছে।

% Step 6: Perform convolution (manually)
for i = 1:m
    for j = 1:n
        sum = 0;
        for a = 1:km
            for b = 1:kn
                x = i + a - 1;
                y = j + b - 1;
                sum = sum + kernel(a, b) * padded_img(x, y);
            end
        end
        sharpened_img(i, j) = sum;
    end
end

% Step 7: Clamp values (0 to 255) for display
sharpened_img = uint8(min(max(sharpened_img, 0), 255));
img = uint8(img);

% Step 8: Show results
fprintf('Original Image:\n');
disp(img);

fprintf('Sharpened Image:\n');
disp(sharpened_img);

figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(sharpened_img); title('Sharpened Image');

%%Using builtin function

%%img = imread('img3.jpg');
%%gray_img = rgb2gray(img);  % RGB → Grayscale
%%kernel = [0 -1 0; -1 5 -1; 0 -1 0];
%%sharpened = conv2(double(gray_img), kernel, 'same');
%%imshow(uint8(sharpened));