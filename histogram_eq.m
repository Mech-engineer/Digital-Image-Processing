% This function is to do histogram equilisation for the image

function img = histogram_eq(image, MN)

%number of intensity levels
L = 256; 
 
h_bin = zeros(L,1);

cdf = zeros(L,1);
cdf_2 = 0

% Counting Intensity
for k = 0:1:255
    h_bin(k+1,1)=size(image(image==k),1)/(MN);
end

%calculating cumulative probability Distribution (CDF)
cdf=cumsum(h_bin(:,1));


for k = 0:1:255   
    cdf_2(k+1)=uint8(round((L-1)*cdf(k+1))); 
    %cdf_2(k+1)=uint8(floor((L-1)*cdf(k+1))); % NOTE: Instead of round we can also use floor function
end

% Histogram equalization
for i = 1:1:size(image,1)
    for j = 1:1:size(image,2)
        img(i,j)=cdf_2(image(i,j)+1);
    end
end

%axis parameters
XMIN = 0; XMAX = L; YMIN = 0; YMAX = 255;

figure;
subplot(1,3,1); imshow(image);
title('Original Image');
hold on
subplot(1,3,2); imshow(img,[]);
title('Transformed Image');
subplot(1,3,3);stairs((0:255),cdf_2); axis([XMIN XMAX YMIN YMAX]);
title('Transformation Function');
xlabel('Gray Values (1-256)');
ylabel('Transformed Gray Values (1-256)');
hold off

imwrite(img(:,:,1),'Histogram_Image\\transformedimage.jpg')



%display_image_hist(img, MN ,'Histogram of New Image', 'Image_hist_2')