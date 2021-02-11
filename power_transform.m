% This is a power transformation function that takes in the following parameters:
% image -> the image to be transformed
% c -> is a user defined parameter that controls the non linearity
% gamma -> is the user defined parameter

% Equation for log transform is s = c*(r ^ gamma)
% where r is the input image, s is the output image and c is a user defined
% parameter for non linearity.


function img = power_transform(image,c, gamma)
img = c * (image.^gamma);
end