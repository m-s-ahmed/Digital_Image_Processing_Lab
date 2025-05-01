img = imread('img1.jpg');
img = imresize(img, [256 256]);
img = im2double(img);

[rows, cols, channels] = size(img);
neg_img = zeros(rows, cols, channels);

for i = 1:rows
    for j = 1:cols
        for k = 1:channels
            neg_img(i,j,k) = 1 - img(i,j,k);   % pixel-wise negate
        end
    end
end

figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(neg_img); title('Negative (Manual)');
