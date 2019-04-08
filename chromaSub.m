% chromaSub.m - applies chroma subsampling to the image
% chromaSub(image)
% sourceImg: the rgb image matrix to convert
% cols1: the number of columns to sample from the first row
% cols2: the number of columns to sample from the second row
% Note: the image must be in rgb format
% returns rgb image, Cb gray image, and Cr gray image
% 
% TJ Couch
% Homework 3
% CS 443 Multimedia
% 3/10/19

function [rgbImage, cbImage, crImage] = chromaSub(sourceImg, cols1, cols2)

%get image size
imSize = size(sourceImg);

%convert to YCbCr
yCbCrImg = convertToYCbCr(sourceImg);

%create blank image matrices
yccSubImg = zeros(imSize);%subsampled image
cbImage = zeros(imSize);%Cb gray image
crImage = zeros(imSize);%Cr gray image

for i = 1:imSize(1)
    for j = 1:imSize(2)
        %apply 4:cols1:cols2 subsampling
        %copy Cb and Cr as the pattern specifies by row and by column
        %1st and 2nd row - get first in group of four columns
        %copy y
        yccSubImg(i, j, 1) = yCbCrImg(i, j, 1);
        %subsample Cb and Cr
        cb = yCbCrImg(i, floor((j - 1) / (4 / cols1)) * (4 / cols1) + 1, 2);
        cr = yCbCrImg(i, floor((j - 1) / (4 / cols2)) * (4 / cols2) + 1, 3);
        yccSubImg(i, j, 2) = cb;
        yccSubImg(i, j, 3) = cr;
        
        %apply gray images
        for k = 1:imSize(3)
            cbImage(i, j, k) = cb;
            crImage(i, j, k) = cr;
        end
    end
end

%create subsampled rgb image
rgbImage = convertFromYCbCr(yccSubImg);