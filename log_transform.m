% This is a log transform function that takes in the following parameters:
% image -> the image to be transformed
% c -> is a user defined parameter that controls the non linearity

% Equation for log transform is s = c* log(1+r)
% where r is the input image, s is the output image and c is a user defined
% parameter for non linearity.


function img = log_transform(image,c)
img = c* (log(1+image));
end