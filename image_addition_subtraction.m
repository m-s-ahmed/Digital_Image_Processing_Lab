% ==== Image Addition and Subtraction WITHOUT Built-in Arithmetic ====

% Step 1: ছবি পড়া
img1 = imread('img1.jpg');
img2 = imread('img2.jpg');

% Step 2: সাইজ এক করা
img1 = imresize(img1, [256 256]);
img2 = imresize(img2, [256 256]);

% Step 3: ডাবল টাইপে কনভার্ট
img1 = im2double(img1);
img2 = im2double(img2);

% Step 4: ইমেজের সাইজ বের করা
[rows, cols, channels] = size(img1);

% Step 5: খালি ম্যাট্রিক্স তৈরি করা
added_img = zeros(rows, cols, channels);
subtracted_img = zeros(rows, cols, channels);

% Step 6: পিক্সেল বাই পিক্সেল লুপ করে যোগ ও বিয়োগ
for i = 1:rows
    for j = 1:cols
        for k = 1:channels
            % Addition
            val = img1(i,j,k) + img2(i,j,k);
            if val > 1
                val = 1;  % overflow নিয়ন্ত্রণ
            end
            added_img(i,j,k) = val;

            % Subtraction
            val = img1(i,j,k) - img2(i,j,k);
            if val < 0
                val = 0;  % underflow নিয়ন্ত্রণ
            end
            subtracted_img(i,j,k) = val;
        end
    end
end

% Step 7: Show all images
figure;
subplot(2,2,1); imshow(img1); title('Image 1');
subplot(2,2,2); imshow(img2); title('Image 2');
subplot(2,2,3); imshow(added_img); title('Added (Manual)');
subplot(2,2,4); imshow(subtracted_img); title('Subtracted (Manual)');
