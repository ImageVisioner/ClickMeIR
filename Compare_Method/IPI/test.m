clc;
close all;
tic

%strDir 和 strDir1可以修改
% strDir = 'C:\Users\ImageVisioner\Desktop\DeeplearningImageFusion_code_ver1105\small_result\IRSTD-1k\IRSTD1k_Img\';
strDir ='images/'
strDir1 = 'results/';
files = dir([strDir '*.png']); % 获取文件夹中所有png文件
opt.dw = 50;
opt.dh = 50;
opt.x_step = 10;
opt.y_step = 10;

% 保存文件列表长度
numFiles = length(files);

for i=1:numFiles
    fileName = files(i).name;
    fprintf('%d/%d: %s\n', i, numFiles, fileName);
    I = imread([strDir fileName]);
    disp("dd")
    [A, E] = winRPCA_median(I, opt);
   
    maxv = max(max(double(I)));
    A = uint8( mat2gray(A) * maxv );
    E = uint8( mat2gray(E) * 255 );

    % 保存处理后的图片
    imwrite(E, [strDir1 'E/' fileName]);
    % figure,imshow(E)
    imwrite(A, [strDir1 'A/' fileName]);
    % figure,imshow(A)
end

% 计算平均时间
t=toc;
avgTime=t/numFiles;
disp(avgTime)