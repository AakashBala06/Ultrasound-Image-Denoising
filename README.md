#  Ultrasound Image Denoising and Feature Enhancement

This MATLAB-based project improves the quality of medical ultrasound images by applying a series of image processing techniques focused on noise reduction and feature enhancement. By enhancing diagnostic image clarity, the project simulates a practical biomedical imaging workflow relevant to early-stage diagnostic support.

##  Objective

To denoise and enhance real-world ultrasound (echocardiogram) images using multiple techniques in MATLAB, with the goal of improving feature visibility for clinical interpretation.

##  Tools & Technologies

- MATLAB Online  
- Image Processing Toolbox  
- Ultrasound image: `ultrasound_image.jpeg`

##  Methodology

### 1. Preprocessing
- Loaded the ultrasound image and converted it to grayscale.

### 2. Denoising Techniques
- **Median Filtering (3×3):** Removed salt-and-pepper noise.
- **Wiener Filtering (5×5):** Applied local adaptive filtering to reduce noise while preserving edges.
- **Anisotropic Diffusion:** Reduced speckle noise while maintaining anatomical structures.

### 3. Feature Enhancement Techniques
- **Histogram Equalization:** Increased global contrast.
- **Contrast Adjustment:** Improved brightness and dynamic range.
- **Laplacian Edge Enhancement:** Sharpened anatomical boundaries for better definition.

### 4. Quantitative Evaluation
Performance was evaluated using two metrics:
- **PSNR (Peak Signal-to-Noise Ratio)**
- **SSIM (Structural Similarity Index)**

| Method              | PSNR (dB) | SSIM   |
|---------------------|-----------|--------|
| Median Filter       | 36.15     | 0.9785 |
| Wiener Filter       | 37.19     | 0.9521 |
| Anisotropic Filter  | 36.03     | 0.9522 |

##  Results

- **Wiener Filter** had the highest PSNR, indicating best noise reduction.
- **Median Filter** achieved the highest SSIM, showing superior structural preservation.
- Visual results (side-by-side figures) demonstrated improved image clarity and contrast after each processing step.

##  Conclusion

This project successfully enhanced ultrasound image clarity using MATLAB image processing techniques. While the Wiener filter excelled at noise reduction, the median filter preserved structural details best. These results highlight a critical trade-off in biomedical imaging between denoising and preserving diagnostic features.

In real-world clinical settings, such enhancements can aid in detecting conditions such as valve defects or soft tissue abnormalities more effectively.

