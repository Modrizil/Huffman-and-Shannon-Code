%fileProcess  �����������������txt�ļ����õ��ı����ݺͶ�Ӧ����ĸ��
%
%���룺        filename -- �ļ������ƣ���ʽ���ַ�����
%�����        txt -- Դ�ļ����ı��ַ���
%             list -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�������ı��еĸ���


function [txt,list] = fileProcess(filename)

%�����ı��ļ�
data = importdata(filename);

%��ȡ�ı��е��ַ���������txt������
len = length(data);
txt = [];

for i = 1 : len
    txt = [txt, data{i}];
end

%��ȡ��ͬ���ַ���������character������
character = unique(txt);
%ͳ�Ʋ�ͬ�ַ����������г��ֵĴ���������num������
ch_len = length(character);
num = zeros(ch_len, 1);
for i = 1 : ch_len
    num(i) = length(strfind(txt, character(i)));
end

%��num�������н�������
[who, index] = sort(num, 'descend');
total = sum(num);

%����list����������
list = cell(ch_len, 2);

for i = 1 : ch_len
    list{i,1} = character(index(i));
    list{i,2} = who(i) / total;
end

end

