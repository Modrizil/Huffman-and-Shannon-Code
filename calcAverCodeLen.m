% calcAverCodeLen ����������������ƽ���볤
% 
% ���룺     codeword -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�ĸ��ʣ�������Ϊ���ַ��Ĺ���������
% �����     averLength -- �ַ������ƽ���볤

function averLength = calcAverCodeLen(codeword)

len = size(codeword, 1);

averLength = 0;

for i = 1 : len
    word_len = length(codeword{i,3});
    p = codeword{i,2};
    averLength = averLength + p * word_len;
end

end