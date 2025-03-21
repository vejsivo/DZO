function img_matched = match_hists(img, img_target, intensity_levels)
    if nargin < 3
        intensity_levels = 256;
    end

    img_cdf    = compute_cdf(img, intensity_levels);
    target_cdf = compute_cdf(img_target, intensity_levels);
    
    inv_target_cdf = invert_cdf(target_cdf, intensity_levels);
    cdf_axis = linspace(0, 1, intensity_levels);

    matching_lut = zeros(intensity_levels, 1);
    
    for i = 1:intensity_levels
        cdf_val = img_cdf(i);
        matching_lut(i) = interp1(cdf_axis, inv_target_cdf, cdf_val, 'linear', 'extrap');
    end
    
    round_img = round(img * (intensity_levels - 1));
    img_matched = zeros(size(img));

    for x = 1:size(img,1)
        for y = 1:size(img,2)
            old_intensity = round_img(x,y) + 1;             
            new_intensity = matching_lut(old_intensity);   
            img_matched(x,y) = new_intensity / (intensity_levels - 1);
        end
    end
end

function inverted_map = invert_cdf(cdf_vector, intensity_values)
    intensities = (0:intensity_values-1)';
    cdf_vector = cdf_vector(:);
    [cdf_unique, unique_idx] = unique(cdf_vector);
    intensities_unique = intensities(unique_idx);
    query_points = linspace(0, 1, intensity_values);
    inverted_map = interp1(cdf_unique, intensities_unique, query_points, 'linear', 'extrap');
end


