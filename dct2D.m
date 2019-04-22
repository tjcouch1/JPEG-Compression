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
for originRow = 1:blockSize:imSize(1) %block origin point (0, 0) for row
    for originCol = 1:blockSize:imSize(2) %block origin point (0, 0) for column
        %max row for block, generally 0-7. Cut off for end of image
        blockTopRow = blockSize - 1;
        if (originRow + blockTopRow > imSize(1))
            blockTopRow = imSize(1) - originRow;
        end
        %max column for block, generally 0-7. Cut off for end of image
        blockTopCol = blockSize - 1;
        if (originCol + blockTopCol > imSize(2))
            blockTopCol = imSize(2) - originCol;
        end
        
        %for each u and v
        for u = 0:blockTopRow
            %get c value for u
            cu = 1;
            if (u == 0)
                cu = 0.70710678118;%sqrt(2) / 2 but fast
            end
            for v = 0:blockTopCol
                %get c value for v
                cv = 1;
                if (v == 0)
                    cv = 0.70710678118;%sqrt(2) / 2 but fast
                end
                
                cosSumY = 0;%all the stuff inside the i and j loops
                cosSumCb = 0;%all the stuff inside the i and j loops
                cosSumCr = 0;%all the stuff inside the i and j loops
                %for each pixel in the block
                for i = 0:blockTopRow
                    for j = 0:blockTopCol
                        dI = double(i);
                        dJ = double(j);
                        %cos * cos * f(i, j)
                        cosSumY = cosSumY + cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(subsampledImg(originRow + i, originCol + j, 1));
                        cosSumCb = cosSumCb + cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(subsampledImg(originRow + i, originCol + j, 2));
                        cosSumCr = cosSumCr + cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(subsampledImg(originRow + i, originCol + j, 3));
                    end
                end
                
                %calculate final F(u, v)
                dctImg(originRow + u, originCol + v, 1) = cu * cv / 4 * cosSumY;
                dctImg(originRow + u, originCol + v, 2) = cu * cv / 4 * cosSumCb;
                dctImg(originRow + u, originCol + v, 3) = cu * cv / 4 * cosSumCr;
            end
        end
    end
end

%return dct image
f = dctImg;