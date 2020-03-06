% Huffman �����������ڸ������ݽ��й���������
% 
% ���룺     list -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�������ı��еĸ���
% �����     codeword -- cell���飬��һ��Ϊ��ͬ���ַ����ڶ���Ϊ��Ӧ�ĸ��ʣ�������Ϊ���ַ��Ĺ���������


function codeword = Huffman(list)

len = size(list, 1);
%��������������ı�
codeword = cell(len, 1);
Pr = cell2mat(list(:,2));

%ֻ��һ���ַ����������ַ�ʱ�ı���
if(len == 1)
    codeword{1} = '0';  
elseif(len == 2)
    codeword{1} = '0';
    codeword{2} = '1';
%���������������ϵ��ַ�ʱ�����ݱ���
else
    %groupΪÿ����������ʱ����Ҫ���ĵ�һ�����ݽű�
    group = 1 : len;
    group = num2cell(group', 2);%��cell����ʽ���׸�������
    while(length(Pr) >= 2)%�������е����ݶ���������ʱ���������
        [P,index] = sort(Pr);%���򣬻�õ�ǰ������С����������ֵ����Ӧ���±꣬Ҳ���Ƕ�Ӧ��group���±�
        [codeword, group, Pr] = Update(Pr, codeword, group, index(1:2));%����Update����������codeword��group��Pr
    end
end

%��������ַ������ʺ���һ����Ϊ���
codeword = [list, codeword];

end

