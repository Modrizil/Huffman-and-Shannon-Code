%calcEntropy  ������������������ݵ���Ϣ��

%���룺        list -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�������ı��еĸ���
%�����        H -- ��Ϣ��

function H = calcEntropy(list)

len = size(list, 1);
H = 0;

for i = 1 : len
    p = list{i,2};
    H = - p * log(p)/log(2) + H;
end

end