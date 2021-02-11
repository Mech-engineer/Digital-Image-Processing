% This is  a function to display images in the form of a grid

function display_images(image_list,title_list, rows)
figure();


total_images = size(image_list,3);
m = round((total_images)/(round(total_images/rows)));
n = round(total_images/rows);

for i=1:1:size(image_list,3)
    subplot(m,n,i);
    imshow(image_list(:,:,i));
    title(title_list{i});
    hold on
end
hold off


    
    
end
