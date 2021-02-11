%% ECE1512: Digital Image Processing - Assignment 1
% Loading image

clear all
clc

% name of the file we will work with
image_name = 'fractured_spine.tif';

% load image
image = load_image(image_name);

%looking at the image
%display_image(image, 'Original Image');

% Normalize the image
image_norm = image_normalize(image);



%% -------------------------------Part A (1)------------------------------
% %#######################################################################
%                     LOG TRANSFORMATION
%           (1) The log transformation of Eq. (3.2-2)
%                       s = c*log(+r)

mkdir('Log_Transform_images')

% create multiple values for the 'c' parameter
c_values = linspace(1,6,10)

% THIS IS JUST A TEST CASE {
%l2 = log_transform(image_norm,4.5);
%display_image(l2, 'Test Image');
%}

% Now running a for loop and calling log transformation function
for i = 1:1:size(c_values,2)
    log_images(:,:,i) = log_transform(image_norm,c_values(1,i));
    titles_log{i} = sprintf('Log Transformation (c=%d)',c_values(1,i));
    
    %imwrite(log_images(:,:,i),sprintf('Log_Transform_images\\%d.jpg',c_values(1,i)));
end



% Displaying transformed Images
display_images(log_images, titles_log,2);

%#########################################################################
%--------------------------------------------------------------------------



%% -------------------------------Part A (2)------------------------------
%########################################################################
%                    POWER TRANSFORMATION
% (2) A power-law transformation of the form shown in Eq. (3.2-3).

%creating a folder for power transfor
mkdir('power_Transform_images')

% creating multiple values for gamma parameters

gamma=linspace(0.1,1.0,10)

for i=1:1:size(c_values,2)
    for j = 1:1:size(gamma,2)
        
        % Implementing Power Law Function and Also assigning Title
        power_images(:,:,i,j) = power_transform(image_norm,c_values(1,i),gamma(1,j));
        titles_power{i,j} = sprintf('Pwr Trans(c=%d , gamma = %d)',round(c_values(1,i),3),round(gamma(1,j),3));
        imwrite(power_images(:,:,i,j),sprintf('Power_Transform_images\\(c=%d , gamma = %d).jpg',c_values(1,i),gamma(1,j)));
        
        %Extra line for testing
        %saveas(log_images(:,:,i),sprintf('Power_Transform_images2\\(c=%d , gamma = %d).jpg',c_values(1,i),gamma(1,j)));
        
        % Also getting Images for c =1 and gamma = 0.5 to display later
        if i == 1
            power_images_c_1(:,:,j) = power_images(:,:,i,j);
            titles_power_c_1{j} =  titles_power{i,j};
        
        elseif j == 5
            power_images_g_5(:,:,i) = power_images(:,:,i,j);
            titles_power_g_5{i} =  titles_power{i,j};
            
        end
        
    
    end
end

% Uncomment line below to display all the images
%display_images_2(power_images, titles_power,10);

% Displaying transformed Images for c = 1
%display_images(power_images_c_1, titles_power_c_1,2);


% Displaying transformed Images for gamma = 0.5
display_images(power_images_g_5, titles_power_g_5,2);
hold off;
%#########################################################################
%--------------------------------------------------------------------------


%% -------------------------------Part B -----------------------------------
% %#######################################################################
%                     Histogram Equalization
% using PDF of histogram to transform the complete image
%                           Ps(s) = pr(r)|dr/ds|



[image_row,image_column] = size(image);

MN = image_row * image_column;

display_image_hist(image, MN ,'Histogram of Original Image', 'Image_hist_1')

%double(max(image(:)))

img2 = histogram_eq(image, MN);
    
display_image_hist(img2, MN ,'Histogram of New Image', 'Image_hist_2')

%#########################################################################
%--------------------------------------------------------------------------