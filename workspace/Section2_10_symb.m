clc;clear
% 1. 定义一个符号变量和函数 $f(x)$
syms x              % 告诉 Matlab：$x$ 是“符号”
f = x^3 - 2*x + 1;  % 像在高数里写函数
% 2. 求导 $f'(x)$
df = diff(f)        % 结果：$3\times x^2 - 2$
% 3. 求不定积分 $\int f(x) dx$
F = int(f)          % 结果：$x^4/4 - x^2 + x$
% 4. 求定积分 $\int_0^1 f(x) dx$
I = int(f, x, 0, 1) % 得到一个精确结果（分数）
% 5. 在 $x = 2$ 处代入
val = subs(f, x, 2) % 把 x 换成 2 代入