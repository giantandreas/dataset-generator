imgBg = imread("background\1.jpg");
img = imread("1.png");

[pBg,lBg] = size(imgBg);
dense = randi(20)/100;
imgTempered = addNoise(img,dense);
imgTempered = rotateImg(imgTempered,(10-randi(5)));
imgTempered = changBackground(imgTempered);
figure, imshow(imgTempered)
[p,l] = size(imgTempered);
scaling = 0.0;
prob = (0.02 * randi(100) / 100);
if(pBg/p < lBg/l)
    scaling = (pBg/p)-0.001-prob;
else
    scaling = (lBg/l)-0.001-prob;
end
newImg = scaleImgToBackground(imgTempered,imgBg,scaling);
figure,imshow(newImg);
imwrite(newImg,"result/1.png")
