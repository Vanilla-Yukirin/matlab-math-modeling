%% 展示
clc; clear;
f = @(v) (v(1)-2).^2 + (v(2)+1).^2 + sin(v(1)*v(2));
[X,Y] = meshgrid(linspace(-4,4,200), linspace(-4,4,200));
Z = arrayfun(@(x,y) f([x,y]), X, Y);
figure;
surf(X, Y, Z, 'EdgeColor','none'); colormap parula;
title("f(x,y) = (x-2)^2 + (y+1)^2 + sin(xy)");
xlabel("x"); ylabel("y"); zlabel("f");

%% 求解
clc; clear;
% 定义目标函数 f(v)，其中 v 是长度为 2 的向量 v = [x, y]
f = @(v) (v(1)-2).^2 + (v(2)+1).^2 + sin(v(1)*v(2)); % v(1) 对应 x，v(2) 对应 y
x0 = [0, 0]; % 选择初始点 x0
[x_min, fval] = fminsearch(f, x0);
[X,Y] = meshgrid(linspace(-4,4,200), linspace(-4,4,200)); % 为了可视化三维曲面，我们生成一个网格 (X, Y)
% 对网格上每个点计算 f(x,y)
Z = arrayfun(@(x,y) f([x,y]), X, Y); % arrayfun 的作用：对每个 (x,y) 调用一次 f([x,y])
figure;
surf(X, Y, Z, 'EdgeColor','none'); hold on; % EdgeColor='none' 去掉网格线，让表面更平滑
plot3(x_min(1), x_min(2), fval, 'r.', 'MarkerSize',30); % 在三维图上用红点标出极小值点 $(x_min(1), x_min(2), fval)$
% 美化图像
title("fminsearch 寻找无约束极小值"); xlabel("x"); ylabel("y"); zlabel("f");
colormap parula; % 设置配色。有很多自带的好看的配色 winter summer hot jet
fprintf("best [x,y] = [%.4f, %.4f], f = %.4f\n", x_min(1), x_min(2), fval);
