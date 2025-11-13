clc; clear;
x = [143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]'; % 注意需要先转置，变成列向量
y = [ 88  85  88  91  92  93  93  95  96  98  97  96  98  99 100 102]';
X = [ones(length(x),1), x];
b = regress(y, X);
y_hat = X * b;  % 预测值
figure;
plot(x, y, 'k+', 'MarkerSize',6); hold on;  % 原始数据
plot(x, y_hat, 'r-', 'LineWidth',1.5);      % 回归直线
legend("原始数据","回归直线","Location","best");
grid on;