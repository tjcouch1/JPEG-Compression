% compressInput
% prompts the user for an image, then compresses and decompresses the image at the supplied path
% 
% TJ Couch, Matthew Robertson, Austin Vickers
% JPEG Compression Project
% CS 443 Multimedia
% 4/8/19

close all;

%get the name of the file to compress
fileName = input('Enter the path to the image to compress: ', 's');

if (~exist(fileName, 'file'))%if file doesn't exist, say so. Replace exists with isfile in MATLAB newer than R2017a
    fprintf('File %s does not exist!\n', fileName);
else
    %display the current file to keep track
    fprintf('File: %s\n', fileName);

    %read rgb image
    sourceImg = imread(fileName);

    %compress image
    compressedImg = jpegCompress(sourceImg);
    
    %show image
    %imshow(compressedImg);

    %write compressed image to its own file
    writeName = sprintf('compressed-%s%s', fileName(1:end-4), '.png');
    imwrite(compressedImg, writeName);

    %decompress image
    decompressedImg = jpegDecompress(compressedImg);
    
    %show image
    imshow(decompressedImg);

    %write compressed image to its own file
    writeName = sprintf('decompressed-%s%s', fileName(1:end-4), '.png');
    imwrite(decompressedImg, writeName);
end