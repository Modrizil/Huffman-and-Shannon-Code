%calcEntropy  函数用来计算给定数据的信息熵

%输入：        list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率
%输出：        H -- 信息熵

function H = calcEntropy(list)

len = size(list, 1);
H = 0;

for i = 1 : len
    p = list{i,2};
    H = - p * log(p)/log(2) + H;
end

end