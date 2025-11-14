%% 画图：目标等高线 + 等式曲线 + 线性约束区域 + fmincon 最优点
figure('Name','问题2-2 几何可视化','NumberTitle','off'); hold on; box on;

% 目标函数等高线
contour(x1g, x2g, Z, 30, 'LineWidth', 0.8);
colormap parula;
xlabel('x_1 (风冷转速)');
ylabel('x_2 (水泵流速)');
title('目标函数等高线 + 约束 + fmincon 最优点');
axis([0 5 0 5]);

% 不等式区域 2*x1 + 3*x2 <= 12.5 用半透明色块表示
mask_lin_double = double(mask_lin);
hmask = pcolor(x1g, x2g, mask_lin_double);
set(hmask, 'EdgeColor','none', 'FaceAlpha',0.10);

% 画等式曲线 x1 * x2 = 6（只画合法范围内的）
x1_curve = linspace(0.01, 5, 1000);    % 避免除 0
x2_curve = 6 ./ x1_curve;
valid = (x2_curve >= 0) & (x2_curve <= 5);
plot(x1_curve(valid), x2_curve(valid), 'r-', 'LineWidth', 2, ...
    'DisplayName','x_1 x_2 = 6');

% 画线性约束边界 2*x1 + 3*x2 = 12.5
x1_line = linspace(0,5,200);
x2_line = (12.5 - 2*x1_line)/3;
plot(x1_line, x2_line, 'k--', 'LineWidth', 1.2, ...
    'DisplayName','2x_1 + 3x_2 = 12.5');

% 画 fmincon 找到的最优点
plot(x_opt(1), x_opt(2), 'mo', 'MarkerSize', 10, ...
    'MarkerFaceColor','m', 'DisplayName','fmincon 最优点');

legend('Location','northeastoutside');
hold off;
