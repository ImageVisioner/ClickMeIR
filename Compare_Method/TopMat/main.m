clc;clear;close all

img = imread('XDU147.png');
R_o = 9;
R_i = 4;
delta_B = newRingStrel(R_o, R_i);
B_b = ones(R_i);
img_MNWTH = MNWTH(img, delta_B, B_b);
subplot(221)
imshow(img);title('orignal image')
subplot(223)
Draw3DGrayGraph(img, 0);
subplot(222)
imshow(img_MNWTH);title('MNWTH result')
subplot(224)
Draw3DGrayGraph(img_MNWTH, 0);