% jpegDecompress(image) - decompresses the image matrix according to JPEG decompression
% image: the jpeg compressed image matrix to decompress
% returns decompressed image in rgb format
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

%Written by TJ Couch
function f = jpegDecompress(quantizedImg)

%block size 8
blockSize = 8;

%dequantize
dctImg = dequantize(quantizedImg, blockSize);

%2D IDCT
yCbCrImg = idct2D(dctImg, blockSize);

%convert image to yCbCr
rgbImg = ycbcr2rgb(yCbCrImg);

f = rgbImg;