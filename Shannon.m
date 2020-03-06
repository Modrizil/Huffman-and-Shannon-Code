% ���� Shannon �������ַ�������ũ����
% 
% ���룺     list -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�������ı��еĸ���
% �����     codeword -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�ĸ��ʣ�������Ϊ���ַ�����ũ����

function codeword = Shannon(list)

p = 0;%�ۻ�����

%��ȡ��
len = size(list, 1);
%�������ֱ�
codeword = cell(len, 1);

for i = 1 : len
    %�����Ӧ�ַ����볤
    Pr = list{i,2};
    word_len = ceil(-log(Pr) / log(2));
    
    %�ۻ�����ת��Ϊ�����ƣ����������ֱ�
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
    
    %�����ۻ�����
    p = Pr + p;
end

%��������ַ������ʺ���һ����Ϊ���
codeword = [list, codeword];

end