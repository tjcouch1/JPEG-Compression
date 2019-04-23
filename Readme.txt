# JPEG-Compression

This program implements the JPEG compression algorithm in MATLAB. It also caclulates the pixel-wise and Peak-signal-to-noise-ratio (PSNR) for each of the images. The 'main' method of the program is the compressImages.m file. Run this file in matlab to process the 3 images in the directory, named image1.jpg, image2.jpg, and image3.jpg.

This program was written by TJ Couch, Austin Vickers, and Matthew Robertson

Description of Implementation:
	chromaSub.m - subsamples an image
	compressImages.m - compresses image1, image2, and image3
	compressInput.m - compresses the image whose path was input into the command line
	dct2D.m - applies JPEG standard DCT to the image
	dequantize.m - dequantizes an image
	idct2D.m - applies JPEG standard IDCT to the image
	jpegCompress - compresses an image according to JPEG
	jpegDecompress - decompresses an image according to JPEG
	pixelWiseError.m - calculates the pixel error for an image
	PSNR.m - calculates peak signal to noise ratio on an image
	quantize.m - quantizes an image

To run the program, do one of the following:
	1. Run compressImages in the command line in MATLAB to compress image1.jpg, image2.jpg, and image3.jpg
	2. Run compressInput in the command line in MATLAB to compress the image at the user-input file path