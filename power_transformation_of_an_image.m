clc;
clear;

% === Power log transformation(Gamma transformation) 
% of an image WITHOUT Built-in Arithmetic ====

% 1. Input Image (Grayscale matrix manually)
% সাদা কালো ছবি নিলাম। কালার নিলে গ্রেতে কনভার্ট করে নিতে হবে।
% না করেও হতে পারে , করে দেখতে হবে।

img = imread('img5.jpg');
[row, col] = size(img); % Image এর row আর column বের করা

% 2.pixel value কে 0-1 scale এ আনা হচ্ছে

norm_img = double(img) / 255;  

% Power Law apply করার জন্য 
% float number দরকার হয়, তাই double এ convert করা হয়েছে।া

% 3. Apply Power Law Transformation
%gamma = 0.4; %dark pixel গুলোর মান বাড়ে → image উজ্জ্বল হয়ে যায়. <1
gamma=1.5; %bright pixel গুলোর মান কমে → image dark হয়ে যায় >1
output_img = zeros(row, col);  % output image initialize করা

for i = 1:row
    for j = 1:col
        output_img(i,j) = norm_img(i,j) ^ gamma;
    end
end

% 4. Convert back to 0-255
%কারণ ছবির pixel value আবার image দেখানোর জন্য 0-255 এর মধ্যে আনতে হয়।

output_img = uint8(output_img * 255);

% 5. Show images
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(output_img);
title(['Power Law Enhanced (Gamma = ', num2str(gamma), ')']);
