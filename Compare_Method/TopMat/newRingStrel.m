function [SE] = newRingStrel(R_o,R_i)
% 构造矩形环状结构元素
%   R_o : the radius of out
%   R_i : the radius of inner
%   delta_R = R_o - R_i
    d = 2 * R_o + 1;
    SE = ones(d);
    start_index = R_o + 1 - R_i;
    end_index = R_o +1 + R_i;
    SE(start_index:end_index, start_index:end_index) = 0;
end