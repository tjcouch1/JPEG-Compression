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

%luminance quantization table
lumQuant = [16  11  10  16  24  40  51  61;
            12  12  14  19  26  58  60  55;
            14  13  16  24  40  57  69  56;
            14  17  22  29  51  87  80  62;
            18  22  37  56  68 109 103  77;
            24  35  55  64  81 104 113  92;
            49  64  78  87 103 121 120 101;
            72  92  95  98 112 100 103  99];

%chrominance quantization table
chromQuant = [17 18 24 47 99 99 99 99;
              18 21 26 66 99 99 99 99;
              24 26 56 99 99 99 99 99;
              47 66 99 99 99 99 99 99;
              99 99 99 99 99 99 99 99;
              99 99 99 99 99 99 99 99;
              99 99 99 99 99 99 99 99;
              99 99 99 99 99 99 99 99;];

quantizedImg = zeros(imSize);

for i = 1:imSize(1)
    for j = 1:imSize(2)
        quantizedImg(i, j, 1) = round(dctImg(i, j, 1) / lumQuant(i, j));
        quantizedImg(i, j, 2) = round(dctImg(i, j, 2) / chromQuant(i, j));
        quantizedImg(i, j, 3) = round(dctImg(i, j, 3) / chromQuant(i, j));
    end
end

f = quantizedImg;