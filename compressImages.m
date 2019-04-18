% compressImages
% converts the three images in this directory from rgb to YCbCr
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

close all;

%compress each of 3 images
for i = 1:3
    fileName = sprintf('image%d.jpg', i);
    
    %display the current file to keep track
    fprintf('File: %s\n', fileName);
    
    %read rgb image
    sourceImg = imread(fileName);
    
    %compress image
    compressedImg = chromaSub(sourceImg, 2, 0);%jpegCompress(sourceImg);
    
    %show image
    imshow(compressedImg);
    
    %write compressed image to its own file
    writeName = sprintf('compressed-image%d.png', i);
    imwrite(compressedImg, writeName);
end