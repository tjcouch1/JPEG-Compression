
function f = PSNR(origFrame, newFrame)

%src and final image should be the same size
imsize = size(origFrame);
 
M = imsize(1);
N = imsize(2);

origFrame = im2double(origFrame);
newFrame = im2double(newFrame);

sum = 0;
diff = 0;
for x = 1:M
    for y = 1:N
        diff = origFrame(x,y,1) - newFrame(x,y,1);
        diff = diff + origFrame(x,y,2) - newFrame(x,y,2);
        diff = diff + origFrame(x,y,3) - newFrame(x,y,3);
        
        sum = sum + diff^2;
    end
end

MSE = (1/M*N)*sum;
%%typecast(MSE, 'double');

result = 20*log10(255/sqrt(MSE));

f = result;


