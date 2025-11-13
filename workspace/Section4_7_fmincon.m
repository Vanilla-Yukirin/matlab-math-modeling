%% 展示
clc; clear;
f = @(v) v(1).^2 + v(2).^2 + 3*sin(v(1));
% 用等高线的方式展示目标函数
[x,y] = meshgrid(linspace(-3,3,200), linspace(-3,3,200));
z = arrayfun(@(a,b) f([a,b]), x, y);

figure; contourf(x, y, z, 40); hold on; colormap parula; axis equal;
title("带约束的非线性目标函数");
xlabel("x"); ylabel("y");
theta = linspace(0,2*pi,200);
plot(2*cos(theta), 2*sin(theta), 'k-', 'LineWidth',2); % 画约束区域（圆 x^2 + y^2 <= 4）

%% 求解
clc; clear;
f = @(v) v(1).^2 + v(2).^2 + 3*sin(v(1));
x0 = [1, 1]; % 给一个在可行域内的起点
nonlcon = @(v) deal(v(1)^2 + v(2)^2 - 4, []); % 非线性约束：圆
% 为什么需要deal(xxx,[])？
% 匿名函数通常只返回一个结果。使用 deal(输出1, 输出2, ...) 是为了强制匿名函数返回一个逗号分隔的输出列表
% fmincon 调用这个函数时，就会正确地接收到所需的两个输出
% fmincon 约定：nonlcon(v) 必须返回 [c, ceq]，而本题中没有等式约束
[x_min, fval] = fmincon(f, x0, [],[],[],[],[],[], nonlcon); % 线性约束 A,b,Aeq,beq 和变量上下界 lb, ub 都为空
[x,y] = meshgrid(linspace(-3,3,200), linspace(-3,3,200)); % 在 [-3,3] x [-3,3] 区域上准备一个网格 (x,y)
z = arrayfun(@(a,b) f([a,b]), x, y);
% 可视化
figure; contourf(x, y, z, 40); hold on; colormap parula; axis equal; % 绘制目标函数的 40 条等高线
theta = linspace(0,2*pi,200); plot(2*cos(theta), 2*sin(theta), 'k-', 'LineWidth',2); % 画出约束边界
plot(x_min(1), x_min(2), 'ro', 'MarkerSize',10, 'MarkerFaceColor','r'); % 在图上标出最优点
title("fmincon 求解带圆形约束的非线性优化问题");
xlabel("x"); ylabel("y");
fprintf("最优点 [x,y] = [%.4f, %.4f], f = %.4f\n", x_min(1), x_min(2), fval);
