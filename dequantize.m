% quantize.m - quantizes the DCT image according to JPEG standard
% quantize(image)
% sourceImg: the DCT image matrix to quantize
% Note: the image must be in YCbCr format
% returns quantized DCT image
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

%Written by TJ Couch
function f = quantize(sourceImg)

%get image size
imSize = size(sourceImg);

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
        %get the image position wrapped to the block size for the quantization tables
        quantRow = mod(i - 1, blockSize) + 1;
        quantCol = mod(j - 1, blockSize) + 1;
        
        %divide the dct values by the quantization table values piece-wise
        quantizedImg(i, j, 1) = round(sourceImg(i, j, 1) / lumQuant(quantRow, quantCol));
        quantizedImg(i, j, 2) = round(sourceImg(i, j, 2) / chromQuant(quantRow, quantCol));
        quantizedImg(i, j, 3) = round(sourceImg(i, j, 3) / chromQuant(quantRow, quantCol));
    end
end

%create subsampled rgb image
f = quantizedImg;