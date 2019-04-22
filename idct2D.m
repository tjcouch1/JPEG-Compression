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
        
        %for each pixel in the block
        for i = 0:blockTopRow
            for j = 0:blockTopCol
                
                cosSumY = 0;%all the stuff inside the u and v loops
                cosSumCb = 0;%all the stuff inside the u and v loops
                cosSumCr = 0;%all the stuff inside the u and v loops
                
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
                
                        dI = double(i);
                        dJ = double(j);
                        % cu * cv / 4 * cos * cos * F(u, v)
                        cosSumY = cosSumY + cu * cv / 4 * cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(dctImg(originRow + u, originCol + v, 1));
                        cosSumCb = cosSumCb + cu * cv / 4 * cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(dctImg(originRow + u, originCol + v, 2));
                        cosSumCr = cosSumCr + cu * cv / 4 * cos((2 * dI + 1) * u * pi / 16) * cos((2 * dJ + 1) * v * pi / 16) * int32(dctImg(originRow + u, originCol + v, 3));
                    end
                end
                
                %calculate final f~(i, j)
                yCbCrImg(originRow + i, originCol + j, 1) = cosSumY;
                yCbCrImg(originRow + i, originCol + j, 2) = cosSumCb;
                yCbCrImg(originRow + i, originCol + j, 3) = cosSumCr;
            end
        end
    end
end

%return ycbcr image
f = uint8(yCbCrImg);