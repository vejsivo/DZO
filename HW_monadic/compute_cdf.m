function [img_cdf] = compute_cdf(img, intensity_levels)    
    if nargin < 2
        intensity_levels = 256;
    end

    img_hist = compute_hist(img, intensity_levels);
    img_cdf = cumsum(img_hist);
end
