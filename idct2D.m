% idct2D.m - turns DCT image into time domain using 2D IDCT according to JPEG standard
% idct2D(dctImg, blockSize)
% dctImg: the DCT image matrix to IDCT
% blockSize: the size of the chunks to use
% Note: the image must be in DCT format
% returns YCbCr image
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

%Written by TJ Couch
function f = idct2D(dctImg, blockSize)

%get image size
imSize = size(dctImg);

yCbCrImg = zeros(imSize);

%SAMPLE CODE. REPLACE
for i = 1:imSize(1)
    for j = 1:imSize(2)
        %get the image position wrapped to the block size for the quantization tables
        quantRow = mod(i - 1, blockSize) + 1;
        quantCol = mod(j - 1, blockSize) + 1;
        
        %divide the dct values by the quantization table values piece-wise
        yCbCrImg(i, j, 1) = round(dctImg(i, j, 1) / lumQuant(quantRow, quantCol));
        yCbCrImg(i, j, 2) = round(dctImg(i, j, 2) / chromQuant(quantRow, quantCol));
        yCbCrImg(i, j, 3) = round(dctImg(i, j, 3) / chromQuant(quantRow, quantCol));
    end
end

%return ycbcr image
f = yCbCrImg;