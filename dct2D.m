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

%for each block
for originRow = 1:blockSize:imSize(1)%block origin point (0, 0) for row
    for originCol = 1:blockSize:imSize(2)%block origin point (0, 0) for column
        %max row for block, generally 0-7. Cut off for end of image
        blockTopRow = blockSize - 1;
        if (originRow + blockTopRow > imSize(1))
            blockTopRow = imSize(1) - originRow;
        end
        %max column for block, generally 0-7. Cut off for end of image
        blockTopCol = blockSize - 1;
        if (originCol + blockTopCol > imSize(1))
            blockTopCol = imSize(1) - originRow;
        end
        %for each u and v
        for u = 0:blockTopRow
            for v = 0:blockTopCol
                %get c value for u and v
                cu = 1;
                if (u == 0)
                    cu = 0.70710678118;%sqrt(2) / 2 but fast
                end
                cv = 1;
                if (v == 0)
                    cv = 0.70710678118;%sqrt(2) / 2 but fast
                end
                
                %for each pixel in the block
                for i = 0:blockTopRow
                    for j = 0:blockTopCol
                        
                        subSampledImg(originRow + i, originCol + j, 1)%f(i, j) for Y
                    end
                end
                
                %calculate final F(u, v)
                dctImg(originRow + u, originCol v, 1)%F(u, v) for Y
            end
        end
    end
end

%return dct image
f = dctImg;