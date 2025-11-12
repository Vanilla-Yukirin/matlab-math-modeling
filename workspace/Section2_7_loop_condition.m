clc;clear;


%% if条件语句
score = 85;
if score >= 90
    disp("优秀")
elseif score >= 60
    disp("及格")
else
    disp("挂科")
end

%% for循环
sum_val = 0;
for i = 1:100
    sum_val = sum_val + i;  % 计算1+2+...+100
end
disp(sum_val)  % 结果：5050


% 错误示范：在循环中动态扩展数组
% 每次循环都要重新分配内存
A = []; % 应该写成 A=zeros(10000,1);
for i = 1:10000
    A(i) = i;  
end
% 会给警告：变量的大小似乎在(脚本内的)每个循环迭代都会更改。请考虑进行预分配以提升速度。



%% 向量化

% 判断成绩等级
scores = [85, 92, 45, 78];  % 4个学生的成绩
pass = scores >= 60;        % [1, 1, 0, 1] 逻辑向量
disp(scores(pass))          % 直接输出及格分数：[85,92,78]

% 计算1+2+...+100
sum_val = sum(1:100);  % 1行代码 vs 5行循环