% ==== RGB image to Binary image conversion WITHOUT Built-in Arithmetic ====

img = imread('img3.jpg');
img = imresize(img, [256 256]);
img = im2double(img);% 0 থেকে 1 স্কেলে আনা

%এই লাইনটা পুরো ইমেজের R, G, B চ্যানেলের matrix অপারেশন করে একসাথে গ্রেস্কেল বানায়। 
% চাইলে loop দিয়েও করা যায়, কিন্তু এটা faster & efficient

gray_img = 0.2989*img(:,:,1) + 0.5870*img(:,:,2) + 0.1140*img(:,:,3);

% [rows, cols, ~] = size(img);
% gray_img = zeros(rows, cols);
% 
% for i = 1:rows
%     for j = 1:cols
%         R = img(i,j,1);
%         G = img(i,j,2);
%         B = img(i,j,3);
%         gray_img(i,j) = 0.2989*R + 0.5870*G + 0.1140*B;
%     end
% end

threshold = 0.5; % ম্যানুয়াল থ্রেশহোল্ড (চাইলে পরিবর্তন করা যায়)
[rows, cols] = size(gray_img);
binary_img = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        if gray_img(i,j) >= threshold
            binary_img(i,j) = 1;
        else
            binary_img(i,j) = 0;
        end
    end
end

figure;
subplot(1,3,1); imshow(img); title('Original RGB Image');
subplot(1,3,2); imshow(gray_img); title('Grayscale Image');
subplot(1,3,3); imshow(binary_img); title('Binary Image (Manual)');
