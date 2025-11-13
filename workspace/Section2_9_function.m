[data_mean, data_std] = stat2([1,2,3,4,5])
% 函数也支持向量化运算，可以实现输入向量或矩阵得到批量运算结果。
[datas_mean, datas_std] = stat2([1,2,3;4,5,6;7,8,9])