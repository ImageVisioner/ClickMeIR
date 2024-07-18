%这段代码已经被修改成批量保存的形式
% 添加计时功能
% 删除非必要功能
clc;
close all;
tic
%strDir  strDir1可以修改
strDir = 'C:\Users\ImageVisioner\Desktop\DeeplearningImageFusion_code_ver1105\small_result\IRSTD-1k\IRSTD1k_Img\';
strDir1 = 'irstdikResult/';
files = dir([strDir '*.png']); % 获取文件夹中所有jpg文件
opt.dw = 50;
opt.dh = 50;
opt.x_step = 10;
opt.y_step = 10;

for i=1:length(files)
    fprintf('%d/%d: %s\n', length(files), i, files(i).name);
    I = imread([strDir files(i).name]);
    [A, E] = winRPCA_median(I, opt);
    maxv = max(max(double(I)));
    A = uint8( mat2gray(A) * maxv );
    E = uint8( mat2gray(E) * 255 );
    %% show results
    % 保存处理后的图片
    imwrite(E, [strDir1 'E/' files(i).name]);
    figure,imshow(E)
    imwrite(A, [strDir1 'A/' files(i).name]);
    figure,imshow(A)
end
t=toc;
avgTime=t/length(files);
disp(avgTime)
close all