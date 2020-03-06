% Huffman 函数用来对于给定数据进行哈夫曼编码
% 
% 输入：     list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率
% 输出：     codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的哈夫曼编码


function codeword = Huffman(list)

len = size(list, 1);
%创建哈夫曼编码的表单
codeword = cell(len, 1);
Pr = cell2mat(list(:,2));

%只有一个字符或者两个字符时的编码
if(len == 1)
    codeword{1} = '0';  
elseif(len == 2)
    codeword{1} = '0';
    codeword{2} = '1';
%有三个或三个以上的字符时的数据编码
else
    %group为每次修正编码时都需要更改的一类数据脚标
    group = 1 : len;
    group = num2cell(group', 2);%以cell的形式容易更改数据
    while(length(Pr) >= 2)%当概率中的数据多于两个的时候，仍需编码
        [P,index] = sort(Pr);%排序，获得当前概率最小的两个概率值及对应的下标，也就是对应的group的下标
        [codeword, group, Pr] = Update(Pr, codeword, group, index(1:2));%调用Update函数，更新codeword，group，Pr
    end
end

%将编码和字符、概率和在一起，作为输出
codeword = [list, codeword];

end

