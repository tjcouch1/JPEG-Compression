% jpegCompress(image) - compresses the image matrix according to JPEG compression
% image: the rgb image matrix to compress
% Note: the image must be in rgb format
% returns compressed image in jpeg compressed format
% 
% TJ Couch, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

function f = jpegCompress(sourceImg)

%get image size
imSize = size(sourceImg);

%convert image to yCbCr
yCbCrImg = rgb2ycbcr(sourceImg);

%chroma subsample the image 4:2:0
%probably doesn't work because of the 0
%actually I think my chroma sub is just incorrect haha whoops
%subsampledImg = chromaSub(image, 2, 0);
subsampledImg = yCbCrImg;

%2D DCT with block size 8
blockSize = 8;
dctImg = subsampledImg;

%quantize
quantizedImg = dctImg;

f = quantizedImg;