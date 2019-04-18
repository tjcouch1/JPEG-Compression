% jpegDecompress(image) - decompresses the image matrix according to JPEG decompression
% image: the jpeg compressed image matrix to decompress
% returns decompressed image in rgb format
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

function f = jpegDecompress(quantizedImg)

%get image size
imSize = size(quantizedImg);

%dequantize

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

dctImg = quantizedImg;

%2D IDCT with block size 8
blockSize = 8;
yCbCrImg = dctImg;

%convert image to yCbCr
rgbImg = ycbcr2rgb(yCbCrImg);

f = rgbImg;