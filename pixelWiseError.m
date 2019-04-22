
function f = pixelWiseError(sourceImg, finalImg)

%src and final image should be the same size
imsize = size(sourceImg);

%create blank image for the difference
errorImg = uint8(zeros(imsize));

%create an x by y array to add all the differences together
totalError = uint8(zeros(imsize(1),imsize(2)));

for i = 1:imsize(1)
   for j = 1:imsize(2)
      errorImg(i,j,1) = sourceImg(i,j,1) - finalImg(i,j,1);
      errorImg(i,j,2) = sourceImg(i,j,2) - finalImg(i,j,2);
      errorImg(i,j,3) = sourceImg(i,j,3) - finalImg(i,j,3);
      
      totalError(i,j) = errorImg(i,j,1) + errorImg(i,j,2) + errorImg(i,j,3);
   end
end

f = totalError;

