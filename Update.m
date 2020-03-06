% 函数 Update 为函数Huffman的子函数，用于更新数据
% 
% 输入：         codeword -- 各个不同字符对应的有待更新的码字
%               Pr -- 子节点还未合并的概率
%               group -- 需要更新的下标类
%               index -- 输入两个需要更改的group下标
% 输出：         codeword -- 更新完后的码字
%               group -- 更新完后的下标分类
%               Pr -- 更新完后的概率


function [codeword, group, Pr] = Update(Pr, codeword, group, index)

%获取需要更新的两个group下标
min1 = index(1);
min2 = index(2);

%获取需要更新的原下标集合
list2update1 = group{min1};
list2update2 = group{min2};

%更新对应的码字
for i = 1 : length(list2update1)
    ori_index = list2update1(i);
    codeword{ori_index} = ['0', codeword{ori_index}];
end

for i = 1 : length(list2update2)
    ori_index = list2update2(i);
    codeword{ori_index} = ['1', codeword{ori_index}];
end

%更新group
group{min1} = [list2update1, list2update2];
group(min2) = [];
%更新Pr
Pr(min1) = Pr(min1) + Pr(min2);
Pr(min2) = [];

end