clc;
clear;

% Step 1: Read a grayscale image manually (without imread)
% Let's define a small sample 5x5 image matrix manually
img = [100 100 100 100 100;
       100 150 150 150 100;
       100 150 200 150 100;
       100 150 150 150 100;
       100 100 100 100 100];

% Step 2: Define a sharpening filter kernel (high-pass filter)
% A basic sharpening kernel is:
%     [  0 -1  0
%      -1  5 -1
%       0 -1  0 ]

kernel = [0 -1 0;
         -1 5 -1;
          0 -1 0];

% Step 3: Get the size of the image and kernel
[m, n] = size(img);
[km, kn] = size(kernel);

% Step 4: Pad the original image to handle borders (1-pixel padding)
pad_size = floor(km / 2); % assuming square kernel
padded_img = zeros(m + 2*pad_size, n + 2*pad_size);

% Copy the original image into the center of padded image
for i = 1:m
    for j = 1:n
        padded_img(i + pad_size, j + pad_size) = img(i, j);
    end
end

% Step 5: Create an output image matrix
sharpened_img = zeros(m, n);

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

% Step 7: Clip pixel values between 0 to 255
for i = 1:m
    for j = 1:n
        if sharpened_img(i, j) < 0
            sharpened_img(i, j) = 0;
        elseif sharpened_img(i, j) > 255
            sharpened_img(i, j) = 255;
        end
    end
end

% Step 8: Display the original and sharpened images
disp('Original Image:');
disp(img);

disp('Sharpened Image:');
disp(uint8(sharpened_img));
