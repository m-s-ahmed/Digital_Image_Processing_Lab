clc;
clear;
% === Histogram of an image WITHOUT Built-in Arithmetic ====

% Step 1: Read the image (RGB)
img = imread('img3.jpg');    % ছবিটি current folder-এ থাকতে হবে

% Step 2: Manually convert to grayscale
[rows, cols, ch] = size(img);
gray_img = zeros(rows, cols);  % গ্রেস্কেল ইমেজ তৈরি করছি

for i = 1:rows
    for j = 1:cols
        R = double(img(i,j,1));
        G = double(img(i,j,2));
        B = double(img(i,j,3));
        gray_img(i,j) = 0.2989 * R + 0.5870 * G + 0.1140 * B;
    end
end

gray_img = uint8(gray_img);  % আবার 0–255 scale এ আনলাম

% Step 3: Calculate histogram manually
hist_manual = zeros(1, 256);   % 256 ঘরের হিস্টোগ্রাম array

for i = 1:rows
    for j = 1:cols
        val = gray_img(i,j);           % পিক্সেল মান (0–255)
        hist_manual(val+1) = hist_manual(val+1) + 1;  % গুনছি
    end
end

% Step 4: Display grayscale image
figure;
imshow(gray_img);
title('Grayscale Image (Manual Conversion)');

% Step 5: Display manual histogram
figure;
bar(0:255, hist_manual, 'b');   % বার চার্ট আঁকছি
xlabel('Intensity Value (0–255)');
ylabel('Pixel Count');
title('Manual Histogram (No Built-in Function)');
