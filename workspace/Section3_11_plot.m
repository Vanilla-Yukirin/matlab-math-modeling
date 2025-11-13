%% 1. plot(y)
clc;clear;close all; % close用来关闭之前生成的绘图窗口
y = [2, 4, 3, 5, 6, 4];
plot(y);               % 本质上是默认 x = 1:length(y)

%% 2. plot(x,y)
clc;clear;close all;
x = 0:0.1:2*pi;      % 自变量
y = sin(x);          % 因变量
plot(x, y);          % 绘制 y = sin(x)

%% 3. 添加标注
clc;clear;close all;
x = 0:0.1:2*pi;
y = sin(x);
plot(x, y)
title("y = sin(x)")    % 标题
xlabel("x (rad)")      % x轴标签
ylabel("y")            % y轴标签
legend("sin(x)")       % 图例（说明线条含义）

%% 4. 多条曲线
clc;clear;close all;
x = 0:0.1:2*pi;

hold on          % 开始叠加
plot(x, sin(x))
plot(x, cos(x))
hold off         % 结束叠加

legend("sin(x)", "cos(x)")

%% 5. 控制线条样式与颜色
clc;clear;close all;
x = 0:0.1:2*pi;

plot(x, sin(x), 'r--', 'LineWidth', 1.5)   % 红色、虚线、加粗
hold on
plot(x, cos(x), 'b-o', 'MarkerSize', 4)    % 蓝色、圆点标记
hold off

legend("sin(x)", "cos(x)")