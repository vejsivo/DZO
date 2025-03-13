%% download image
I = imread('https://upload.wikimedia.org/wikipedia/en/7/7d/Lenna_%28test_image%29.png');

%display image
figure(1); image(I); axis image
title('Input Image')

%% crop the image by 50 pixels on each side
c = 50;

%fill your code here
Ic = I(c + 1:size(I,1) - c, c + 1:size(I,2) - c, : );
%display image
figure(2); image(Ic); axis image
title('Cropped image')
size(Ic)


%% convert image to grayscale 

% GrayScale = 0.2989 * R + 0.5870 * G + 0.1140 * B 

% fill your code here
J = 0.2989 * Ic(:,:,1) + 0.5870 * Ic(:,:,2) + 0.1140 * Ic(:,:,3); 
J = uint8(J);
whos J
% Create 3-channel grayscale images (same value for all channels)

% fill your code here
K = repmat(J, [1,1,3]);
K = uint8(K);

figure(3); image(K); axis image;
title('Grayscale image')


%% Highlight high/low intensity pixels

%- show high intensity pixels in red (I>200);
%- show low intensity in blue (I<50); 

L = K;

%fill your code here
L(L > 200) = 0;
L(:,:,1) = L(:,:,1) + uint8((L(:,:,1) == 0) * 255);

L(L < 50) = 0;
L(:,:,3) = L(:,:,3) + uint8((L(:,:,1) == 0) * 255);



figure(4); image(L); axis image
title('Intensity highlighted image')

%% Add a yellow 10px-thick border around the resulting image

border_size = 10;

%fill your code here
[rows, cols, channels] = size(L);

new_rows = rows + 2 * border_size;
new_cols = cols + 2 * border_size;

M = uint8(zeros(new_rows, new_cols, channels));
M(:,:,1) = 255; 
M(:,:,2) = 255; 
M(:,:,3) = 0;

M(border_size+1:end-border_size, border_size+1:end-border_size, :) = L;
size(M)

figure(5); image(M); axis image
size(M);
title('Image with a yellow border');

%store the image as JPEG
imwrite(M,'result.jpg')

%read from disk
N = imread('result.jpg');
figure(6); image(N); axis image
title('Image result read from disk')
    