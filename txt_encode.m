% txt_encode 函数用来把给定文本按照特定的编码方式编码
% 
% 输入：         txt -- 原文本（格式：字符串）
%               codeword -- 对应字符的码字表
% 输出：         total -- 总文本的编码结果


function total = txt_encode(txt, codeword)

%获取文本长度
txt_len = length(txt);
list = codeword(:,1);
total = [];%创建总编码

for i = 1 : txt_len
    %调用子函数matching，来实现查找编码
    index = matching(txt(i), list);
    %更新总编码文本
    total = [total, codeword{index,3}];
end

end


% matching 为txt_encode的子函数，用来从表中搜索对应表中的位置
% 
% 输入：     ch -- 原文本中的单个字符
%           list -- 对应原函数中codeword中的字符表
% 输出：     index -- 返回list表中的下标

function index = matching(ch, list)

%获取表长
len = length(list);

%查找
for i = 1 : len
    if(ch == list{i})
        index = i;
        return
    end
end

end