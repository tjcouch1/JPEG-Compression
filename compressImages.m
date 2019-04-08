% compressImages
% converts the three images in this directory from rgb to YCbCr
% 
% TJ Couch, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

close all;

%compress each of 3 images
for i = 1:3
    fileName = sprintf('image%d.jpg', i);
    
    fprintf('File: %s\n', fileName);
    
    %read rgb image
    sourceImg = imread(fileName);
    
    %compress image
    compressedImg = jpegCompress(sourceImg);
    
    imshow(compressedImg);
    
    %write compressed image to its own file
    %might need to write as png to preserve the data
    writeName = sprintf("compressed-image%d.jpg", i);
    imwrite(compressedImg, writeName);
end