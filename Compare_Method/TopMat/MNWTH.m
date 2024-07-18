function [out] = MNWTH(img, delta_B, B_b)
% MNWTH算法，检测亮目标
%   img: 待检测图像
%   delta_B, B_b: 结构元素
    
    if(size(img, 3) > 1)
        img = rgb2gray(img);
    end
    
    %% 先膨胀
    img_d = imdilate(img, delta_B);
    
    %% 后腐蚀
    img_e = imerode(img_d, B_b);
    
    %% 图像相减
    out = img - img_e;
    out(find(out<0)) = 0;
    out = mat2gray(out);
end
