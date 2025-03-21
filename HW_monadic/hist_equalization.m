function eq_img = hist_equalization(img)
    intensity_levels = 256;
    img_size = size(img);

    % compute the image CDF
    img_cdf = compute_cdf(img, intensity_levels);  % <= this function needs to be also implemented!
    round_img = round(img * (intensity_levels - 1));
    % equalize the image
    eq_img = zeros(img_size);

    for x = 1:size(round_img, 1)
        for y = 1:size(round_img, 2)
            intensity = round_img(x,y);
            eq_img(x,y) = round(img_cdf(intensity + 1) * 255);
        end
    end
eq_img = eq_img/255;
end