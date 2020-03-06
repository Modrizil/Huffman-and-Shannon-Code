%fileProcess  函数用来处理输入的txt文件，得到文本数据和对应的字母表单
%
%输入：        filename -- 文件的名称（格式：字符串）
%输出：        txt -- 源文件的文本字符串
%             list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率


function [txt,list] = fileProcess(filename)

%导入文本文件
data = importdata(filename);

%提取文本中的字符串，存入txt变量中
len = length(data);
txt = [];

for i = 1 : len
    txt = [txt, data{i}];
end

%获取不同的字符串，存入character变量中
character = unique(txt);
%统计不同字符串在文章中出现的次数，存入num变量中
ch_len = length(character);
num = zeros(ch_len, 1);
for i = 1 : ch_len
    num(i) = length(strfind(txt, character(i)));
end

%对num变量进行降序排列
[who, index] = sort(num, 'descend');
total = sum(num);

%创建list表单，存入结果
list = cell(ch_len, 2);

for i = 1 : ch_len
    list{i,1} = character(index(i));
    list{i,2} = who(i) / total;
end

end

