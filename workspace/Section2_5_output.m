clc;clear;
% 使用分号选择性的输出运算结果
A=[1,2];B=[3,4]; % 不展示A和B
C=A+B            % 展示C（会输出矩阵名）

% 1. disp
disp(A);         % 打印矩阵（不会输出矩阵名）
disp(pi);        % 打印标量（不会输出变量名）
disp("Ciallo~"); % 打印字符串
% 简单直接，适合快速查看
% 不能混合输出文字和数字

% 2. num2str
x = 3.14;
disp(['The value of pi is: ' num2str(x)]) % 注意各个字符串之间需要空格/逗号
% 本质上是字符数组的拼接

% 3. fprintf
x = 3.1415926535;
fprintf('The value of pi rounded to two decimal places is: %.2f\n', x)
fprintf('Today''s temperature is: %d°C\n', 25) % 需要加\n，fprintf不会自动换行