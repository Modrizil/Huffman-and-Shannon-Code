% ���� Update Ϊ����Huffman���Ӻ��������ڸ�������
% 
% ���룺         codeword -- ������ͬ�ַ���Ӧ���д����µ�����
%               Pr -- �ӽڵ㻹δ�ϲ��ĸ���
%               group -- ��Ҫ���µ��±���
%               index -- ����������Ҫ���ĵ�group�±�
% �����         codeword -- ������������
%               group -- ���������±����
%               Pr -- �������ĸ���


function [codeword, group, Pr] = Update(Pr, codeword, group, index)

%��ȡ��Ҫ���µ�����group�±�
min1 = index(1);
min2 = index(2);

%��ȡ��Ҫ���µ�ԭ�±꼯��
list2update1 = group{min1};
list2update2 = group{min2};

%���¶�Ӧ������
for i = 1 : length(list2update1)
    ori_index = list2update1(i);
    codeword{ori_index} = ['0', codeword{ori_index}];
end

for i = 1 : length(list2update2)
    ori_index = list2update2(i);
    codeword{ori_index} = ['1', codeword{ori_index}];
end

%����group
group{min1} = [list2update1, list2update2];
group(min2) = [];
%����Pr
Pr(min1) = Pr(min1) + Pr(min2);
Pr(min2) = [];

end