% compressImages
% converts the three images in this directory from rgb to JPEG compressed and back again
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
    compressedImg = jpegCompress(sourceImg);
    
    %show image values step I
    sourceImg(1:8, 1:8, :)
    compressedImg(1:8, 1:8, :)
    
    %write compressed image to its own file
    writeName = sprintf('compressed-image%d.png', i);
    imwrite(compressedImg, writeName);
    
    %decompress image
    decompressedImg = jpegDecompress(compressedImg);
    
    %show image and values
    imshow(decompressedImg);
    decompressedImg(1:8, 1:8, :)
    
    %calculate pixel wise error
    errorImg = pixelWiseError(sourceImg, decompressedImg);
    imagesc(errorImg)
    
    %compute PSNR
    PSNRresult = PSNR(sourceImg, decompressedImg)
    
    %write decompressed image to its own file
    writeName = sprintf('decompressed-image%d.png', i);
    imwrite(decompressedImg, writeName);
    
    pause
end