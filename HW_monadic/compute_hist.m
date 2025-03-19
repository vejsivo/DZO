function [img_hist] = compute_hist(img, intensity_levels)
%COMPUTE_HIST Summary of this function goes here
%   loops over the whole image and counts the intensities to the histogram
    if ~exist('intensity_levels', 'var')
        intensity_levels = 256;
    end
    round_img = round(img * (intensity_levels - 1));
    [rows, cols] = size(round_img);

    img_hist = zeros(intensity_levels, 1);
    for x = 1:rows
        for y = 1:cols
            img_hist(round_img(x, y) + 1) = img_hist(round_img(x, y) + 1) + 1;
            
        end
    end
    img_hist = img_hist/(rows * cols);
end

