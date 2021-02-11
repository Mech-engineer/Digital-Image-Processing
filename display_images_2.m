% This is  a function to display images in the form of a grid

function display_images_2(image_list,title_list, rows)
figure();


total_images = size(image_list,3)*size(image_list,4)
m = round((total_images)/(round(total_images/rows)))
n = round(total_images/rows)


for i=1:1:size(image_list,3)
    for j=1:1:size(image_list,4)
        subplot(m,n,(((i-1)*10)+j));
        imshow(image_list(:,:,i,j));
        title(title_list{i,j});
        hold on

    end

end
hold off