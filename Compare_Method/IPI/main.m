
clc;
close all;
strDir = 'images/';
strDir1 = 'results/';
files = {'1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg'};
opt.dw = 50;
opt.dh = 50;
opt.x_step = 10;
opt.y_step = 10;
figure('units','normalized','outerposition',[0 0 1 1]);
for i=1:length(files)
    fprintf('%d/%d: %s\n', length(files), i, files{i});
    I = imread([strDir files{i}]);
    [A, E] = winRPCA_median(I, opt);
    maxv = max(max(double(I)));
    A = uint8( mat2gray(A) * maxv );
    E = uint8( mat2gray(E) * 255 );
    %% show results
    hold on;
    p = strcat('Image-',num2str(i));
    subplot(3, length(files), i), imshow(I), title(p);
    if i==1
        ylabel('Original Image');
    end
    subplot(3, length(files), length(files)+i), imshow(A);
    if i==1
        ylabel('Background Image');
    end
    subplot(3, length(files), 2*length(files)+i), imshow(E) ;
    if i==1
        ylabel('Target Image');
    end
    %% save into files
    imwrite(E, [strDir1 'E/' files{i}]);
    imwrite(A, [strDir1 'A/' files{i}]);
end
saveas(gcf, './doc/result.png');