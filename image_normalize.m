% This is an image normalizing function
% that accepts an image as a parameter and returns a normalized image

% reference looked at: https://www.mathworks.com/matlabcentral/answers/109517-image-normalization-in-the-range-0-to-1

function img = image_normalize(image)
img = im2double(image);
end