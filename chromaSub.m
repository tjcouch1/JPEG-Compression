% chromaSub.m - applies chroma subsampling to the image
% chromaSub(image, cols1, cols2)
% sourceImg: the rgb image matrix to convert
% cols1: the number of columns to sample from the first row
% cols2: the number of columns to sample from the second row
% Note: the image must be in rgb format
% returns rgb image, Cb gray image, and Cr gray image
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

function f = chromaSub(sourceImg, cols1, cols2)

%get image size
imSize = size(sourceImg);

%convert to YCbCr
yCbCrImg = rgb2ycbcr(sourceImg);

%create blank image matrices
yccSubImg = uint8(zeros(imSize));%subsampled image

for i = 1:2:imSize(1)%every two rows
    for j = 1:imSize(2)%every column
        %apply 4:cols1:cols2 subsampling
        %copy Cb and Cr as the pattern specifies by row and by column
        %1st and 2nd row - get first in group of four columns
        
        %1st row
        %copy y
        yccSubImg(i, j, 1) = yCbCrImg(i, j, 1);
        %subsample Cb and Cr
        cb = yCbCrImg(i, floor((j - 1) / (4 / cols1)) * (4 / cols1) + 1, 2);
        cr = yCbCrImg(i, floor((j - 1) / (4 / cols1)) * (4 / cols1) + 1, 3);
        yccSubImg(i, j, 2) = cb;
        yccSubImg(i, j, 3) = cr;
        
        %2nd row
        if (i + 1 <= imSize(1))
            %copy y
            yccSubImg(i + 1, j, 1) = yCbCrImg(i + 1, j, 1);
            %subsample Cb and Cr
            %make new cb and cr if it has its own values to get, otherwise use the row 1 values
            if (cols2 > 0)
                cb = yCbCrImg(i + 1, floor((j - 1) / (4 / cols2)) * (4 / cols2) + 1, 2);
                cr = yCbCrImg(i + 1, floor((j - 1) / (4 / cols2)) * (4 / cols2) + 1, 3);
            end
            yccSubImg(i + 1, j, 2) = cb;
            yccSubImg(i + 1, j, 3) = cr;
        end
    end
end

%create subsampled rgb image
f = ycbcr2rgb(yccSubImg);