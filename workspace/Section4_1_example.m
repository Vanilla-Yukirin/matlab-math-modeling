clc; clear;
% 数据：身高 x（cm），腿长 y（cm）
x = [143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164];
y = [ 88  85  88  91  92  93  93  95  96  98  97  96  98  99 100 102];
% 画图
figure;
plot(x, y, 'bo', 'MarkerSize',6, 'LineWidth',1.5);
grid on; % 打开背景的网格，看的更清楚
hold on;
p = polyfit(x, y, 1);
xfit = linspace(min(x), max(x), 100);
yfit = polyval(p, xfit);
plot(xfit, yfit, '--');
xlabel('身高 x / cm');
ylabel('腿长 y / cm');

