% jpegDecompress(image) - decompresses the image matrix according to JPEG decompression
% image: the jpeg compressed image matrix to decompress
% returns decompressed image in rgb format
% 
% TJ Couch, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

function f = jpegDecompress(quantizedImg)

%get image size
imSize = size(quantizedImg);

%dequantize
dctImg = quantizedImg;

%2D IDCT with block size 8
blockSize = 8;
yCbCrImg = dctImg;

%convert image to yCbCr
rgbImg = ycbcr2rgb(yCbCrImg);

f = rgbImg;