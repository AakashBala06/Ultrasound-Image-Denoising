
% Ultrasound Image Denoising and Feature Enhancement
% Aakash Balamurugan - Georgia Tech Biomedical Engineering Portfolio

%% Step 1: Load the original image
img = imread('ultrasound_image.jpeg');
figure;
imshow(img);
title('Original Ultrasound Image');

%% Step 2: Convert to grayscale if needed
if size(img,3) == 3
    img = rgb2gray(img);
end

%% Step 3: Apply Denoising Filters

% 3.1 Median Filter
med_filtered = medfilt2(img, [3 3]);

% 3.2 Wiener Filter
wiener_filtered = wiener2(img, [5 5]);

% 3.3 Anisotropic Diffusion Filter
anisotropic_filtered = imdiffusefilt(img);

%% Step 4: Apply Enhancement Techniques

% 4.1 Histogram Equalization
histeq_img = histeq(anisotropic_filtered);

% 4.2 Contrast Adjustment
contrast_img = imadjust(anisotropic_filtered);

% 4.3 Laplacian Edge Enhancement
h = fspecial('laplacian', 0.2);
laplacian_img = imfilter(anisotropic_filtered, h);

%% Step 5: Display Results

% Denoising Results
figure;
subplot(2,2,1); imshow(img); title('Original Image');
subplot(2,2,2); imshow(med_filtered); title('Median Filtered');
subplot(2,2,3); imshow(wiener_filtered); title('Wiener Filtered');
subplot(2,2,4); imshow(anisotropic_filtered); title('Anisotropic Filtered');

% Enhancement Results
figure;
subplot(2,2,1); imshow(anisotropic_filtered); title('Anisotropic Filtered (Base)');
subplot(2,2,2); imshow(histeq_img); title('Histogram Equalized');
subplot(2,2,3); imshow(contrast_img); title('Contrast Adjusted');
subplot(2,2,4); imshow(laplacian_img); title('Edge Enhanced (Laplacian)');

%% Step 6: Quantitative Evaluation (PSNR and SSIM)

psnr_med = psnr(med_filtered, img);
psnr_wiener = psnr(wiener_filtered, img);
psnr_aniso = psnr(anisotropic_filtered, img);

ssim_med = ssim(med_filtered, img);
ssim_wiener = ssim(wiener_filtered, img);
ssim_aniso = ssim(anisotropic_filtered, img);

fprintf('\n=== Quantitative Evaluation ===\n');
fprintf('PSNR (Median Filter): %.2f dB\n', psnr_med);
fprintf('PSNR (Wiener Filter): %.2f dB\n', psnr_wiener);
fprintf('PSNR (Anisotropic Filter): %.2f dB\n', psnr_aniso);

fprintf('SSIM (Median Filter): %.4f\n', ssim_med);
fprintf('SSIM (Wiener Filter): %.4f\n', ssim_wiener);
fprintf('SSIM (Anisotropic Filter): %.4f\n', ssim_aniso);
