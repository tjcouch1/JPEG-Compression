% dct2D.m - turns YCbCr image into frequency domain using 2D DCT according to JPEG standard
% dct2D(subsampledImg, blockSize)
% subsampledImg: the quantize image matrix to dequantize
% blockSize: the size of the chunks to use
% Note: the image must be in YCbCr format
% returns DCT image
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

%Written by TJ Couch
function f = dct2D(subsampledImg, blockSize)

%get image size
imSize = size(subsampledImg);

dctImg = zeros(imSize);

%SAMPLE CODE. REPLACE
for i = 1:imSize(1)
    for j = 1:imSize(2)
        %get the image position wrapped to the block size for the quantization tables
        quantRow = mod(i - 1, blockSize) + 1;
        quantCol = mod(j - 1, blockSize) + 1;
        
        %multiply the dct values by the quantization table values piece-wise
        dctImg(i, j, 1) = subsampledImg(i, j, 1) * lumQuant(quantRow, quantCol);
        dctImg(i, j, 2) = subsampledImg(i, j, 2) * chromQuant(quantRow, quantCol);
        dctImg(i, j, 3) = subsampledImg(i, j, 3) * chromQuant(quantRow, quantCol);
    end
end

%return dct image
f = dctImg;