% calcAverCodeLen 函数用来计算编码的平均码长
% 
% 输入：     codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的哈夫曼编码
% 输出：     averLength -- 字符编码的平均码长

function averLength = calcAverCodeLen(codeword)

len = size(codeword, 1);

averLength = 0;

for i = 1 : len
    word_len = length(codeword{i,3});
    p = codeword{i,2};
    averLength = averLength + p * word_len;
end

end