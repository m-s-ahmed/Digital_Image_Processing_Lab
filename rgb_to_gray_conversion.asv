% ==== RGB image to Gray image conversion WITHOUT Built-in Arithmetic ====

img = imread('img3.jpg');
img = imresize(img, [256 256]);
img = im2double(img); % 0-1 scale

% ==== এখানে ~ (tilde) হলো MATLAB-এর special symbol যার মানে:"এই মানটা আমি নিচ্ছি না / দরকার নেই"। ====
% ধরো img একটা RGB ইমেজ। তাহলে:size(img) → [256 256 3] মানে:256টা row 256টা column 3টা channel (Red, Green, Blue)


[rows, cols, ~] = size(img);
gray_img = zeros(rows, cols);         % 1 channel grayscale

for i = 1:rows
    for j = 1:cols
        R = img(i,j,1);
        G = img(i,j,2);
        B = img(i,j,3);
        gray_img(i,j) = 0.2989*R + 0.5870*G + 0.1140*B;
    end
end

figure;
subplot(1,2,1); imshow(img); title('Original RGB Image');
subplot(1,2,2); imshow(gray_img); title('Grayscale (Manual)');
