clc;
clear;

% 1. গ্রেস্কেল ছবি ইনপুট
img = imread('cameraman.tif');
[row, col] = size(img);

% 2. Histogram গণনা করা (0-255)
hist = zeros(1,256);  % 256টি gray level

for i = 1:row
    for j = 1:col
        intensity = img(i,j);
        hist(intensity+1) = hist(intensity+1) + 1;  % +1 কারণ MATLAB index 1 থেকে শুরু হয়
    end
end

% 3. Probability Density Function (PDF) বের করা
pdf = hist / (row * col);

% 4. Cumulative Distribution Function (CDF) বের করা
cdf = zeros(1,256);
cdf(1) = pdf(1);
for i = 2:256
    cdf(i) = cdf(i-1) + pdf(i);
end

% 5. CDF কে scale করে 0-255 range-এ আনা (equalized mapping তৈরি)
eq_map = round(cdf * 255);

% 6. Equalized image তৈরি
equalized_img = zeros(row, col, 'uint8');
for i = 1:row
    for j = 1:col
        old_val = img(i,j);
        equalized_img(i,j) = eq_map(old_val+1);
    end
end

% 7. ছবি দেখানো
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(equalized_img);
title('Histogram Equalized Image');


%%Histogram Equalization কী?
→ এটি এমন একটি প্রক্রিয়া যেখানে image-এর contrast বাড়ানোর জন্য histogram কে সমানভাবে ছড়িয়ে দেওয়া হয়।

Histogram কিসে বোঝায়?
→ প্রতিটি intensity value (0-255) কতবার এসেছে সেটির frequency distribution।

CDF কেন দরকার?
→ CDF দিয়েই বুঝি কোন intensity কতটা accumulated হয়েছে। সেটাকেই আমরা mapping-এ ব্যবহার করি।

Image bright হয় নাকি dark?
→ Image এর contrast বাড়ে। Dark area উজ্জ্বল হয়, bright area কমে – সম্পূর্ণ image বেশি balanced দেখায়।

এটা RGB image-এ ব্যবহার করতে পারি?
→ হ্যাঁ, তবে প্রতিটি color channel (R, G, B) আলাদা করে process করতে হয়।
