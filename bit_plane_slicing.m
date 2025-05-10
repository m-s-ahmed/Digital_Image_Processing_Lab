clc;
clear;

% Step 1: Read a grayscale image
I = imread('cameraman.tif'); % Make sure it's 8-bit grayscale
I = double(I); % Convert to double for bitwise operation

% Step 2: Initialize 8 bit planes
[m, n] = size(I);
bit_planes = zeros(m, n, 8); % 3D array: height x width x 8 planes

% Step 3: Loop through each bit plane
for k = 1:8
    for i = 1:m
        for j = 1:n
            pixel = I(i, j);
            % Extract k-th bit: binary shift and mod
            bit = mod(floor(pixel / 2^(k - 1)), 2);
            bit_planes(i, j, k) = bit * 255; % Multiply by 255 to visualize
        end
    end
end

% Step 4: Show all bit planes
figure;
for k = 1:8
    subplot(2, 4, k);
    imshow(uint8(bit_planes(:, :, 9-k))); % show MSB leftmost
    title(['Bit Plane ', num2str(9-k)]);
end
