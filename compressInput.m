% compressInput
% prompts the user for an image, then compresses the image at the supplied path
% 
% TJ Couch, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

close all;

%get the name of the file to compress
fileName = input('Enter the path to the image to compress: ', 's');

if (~exist(fileName, 'file'))%if file doesn't exist, say so. Replace exists with isfile in MATLAB newer than R2017a
    fprintf("File %s does not exist!\n", fileName);
else
    fprintf("File: %s", fileName);

    %read rgb image
    sourceImg = imread(fileName);

    %compress image
    compressedImg = jpegCompress(sourceImg);

    %write compressed image to its own file
    writeName = sprintf("compressed-%s");
    imwrite(yCbCrImg, writeName);
end