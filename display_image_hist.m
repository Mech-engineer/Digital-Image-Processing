% This Function is to display Images with their Histogram:

function display_image_hist(image, MN ,title_image, save_file_title)

mkdir('Histogram_Image')

Image_hist = reshape(image,[MN,1]);

figure;

subplot(1,2,1);
imshow(image,[]);title('Image');
hold on; 

subplot(1,2,2);
hist(Image_hist,0:255);
title(title_image);
xlabel('Gray Values (1-256)');
ylabel('Pixel Count (Frequency)');

%saveas(gcf,sprintf('Histogram_Image\\'+save_file_title+'.jpg'));
hold off;
%ih = hist(Image_hist,0:255);

%imwrite(image,sprintf('Histogram_Image\\%d.jpg',title_image));
%imwrite(ih, sprintf('Histogram_Image\\%d.jpg',save_file_title) );


end