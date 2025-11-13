clc; clear;
x = [143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]'; % 注意需要先转置，变成列向量
y = [ 88  85  88  91  92  93  93  95  96  98  97  96  98  99 100 102]';
% 构建自变量矩阵
X = [ones(length(x),1), x];   % 第一列全1，对应截距beta0
% 使用regress计算回归参数
[b, bint, r, rint, stats] = regress(y, X);
% 显示结果
fprintf("截距beta0 = %.2f\n", b(1));
fprintf("自变量beta1 = %.2f\n", b(2));
fprintf("残差向量 r\n"); disp(r);
fprintf("残差区间 rint\n"); disp(rint); % 若区间跨过0，则该点可能为异常点
% 回归总体统计量 stats
fprintf("R^2（拟合优度）= %.4f\n", stats(1));
fprintf("F 统计量 = %.4f\n", stats(2));
fprintf("p 值 = %.4e\n", stats(3));