% ==== Image zooming and shrinking WITHOUT Built-in Arithmetic ====

img = imread('img3.jpg');
img = imresize(img, [256 256]);     % সাইজ ফিক্স
img = rgb2gray(img);                % সাদাকালো করছি, যাতে 2D হয়
img = im2double(img);               % পিক্সেল মানকে 0-1 স্কেলে আনছি

%scale = 2;% স্কেল ফ্যাক্টর (Zoom in)
scale =0.5;
[rows, cols] = size(img);           % Original image size

new_rows = round(rows * scale);     % নতুন image height
new_cols = round(cols * scale);     % নতুন image width
scaled_img = zeros(new_rows, new_cols);  % খালি ছবি বানালাম (সব পিক্সেল 0)

for i = 1:new_rows
    for j = 1:new_cols
        % পুরোনো পিক্সেলের পজিশন খুঁজছি (Nearest neighbor)
        x = round(i / scale);
        y = round(j / scale);
        
        % যদি পজিশন 0 হয়ে যায়, তাহলে 1 করে দিচ্ছি (index error এড়াতে)
        if x < 1
            x = 1;
        end
        if y < 1
            y = 1;
        end
        
        % নতুন ছবির পিক্সেল মান = পুরাতন ছবির কাছাকাছি পিক্সেল
        scaled_img(i,j) = img(x, y);
    end
end

% ছবি দেখাচ্ছি
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(scaled_img); title('Scaled Image (2x) - Manual');
