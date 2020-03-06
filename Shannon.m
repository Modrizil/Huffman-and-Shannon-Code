% 函数 Shannon 用来对字符创建香农编码
% 
% 输入：     list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率
% 输出：     codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的香农编码

function codeword = Shannon(list)

p = 0;%累积概率

%获取表长
len = size(list, 1);
%创建码字表
codeword = cell(len, 1);

for i = 1 : len
    %计算对应字符的码长
    Pr = list{i,2};
    word_len = ceil(-log(Pr) / log(2));
    
    %累积概率转化为二进制，并更新码字表
    p_bin = p;
    for j = 1 : word_len
        if(2 * p_bin >= 1)
            code = 1;
            p_bin = 2 * p_bin -1;
        else
            code = 0;
            p_bin = 2 * p_bin;
        end
        codeword{i} = [codeword{i}, num2str(code)];
    end
    
    %更新累积概率
    p = Pr + p;
end

%将编码和字符、概率和在一起，作为输出
codeword = [list, codeword];

end