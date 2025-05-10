clc; clear;
img =imread("cameraman.tif");
[row,col]=size(img);

hist=zeros(1,256);

for i=1:row
    for j=1:col
        intensity=img(i,j);
        hist(intensity+1)=hist(intensity+1)+1;
    end
end

pdf=hist/(row*col);
cdf=zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end

eq_map=round(cdf*255);
equalized_img=zeros(1,256);
for i=1:row
    for j=1:col
        old_img=img(i,j);
        equalized_img=eq_map(old_img+1);
    end
end

figure:
subplot(1,2,1)
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(equalized_img);
title("Histogram Equalized Image");
