% txt_encode ���������Ѹ����ı������ض��ı��뷽ʽ����
% 
% ���룺         txt -- ԭ�ı�����ʽ���ַ�����
%               codeword -- ��Ӧ�ַ������ֱ�
% �����         total -- ���ı��ı�����


function total = txt_encode(txt, codeword)

%��ȡ�ı�����
txt_len = length(txt);
list = codeword(:,1);
total = [];%�����ܱ���

for i = 1 : txt_len
    %�����Ӻ���matching����ʵ�ֲ��ұ���
    index = matching(txt(i), list);
    %�����ܱ����ı�
    total = [total, codeword{index,3}];
end

end


% matching Ϊtxt_encode���Ӻ����������ӱ���������Ӧ���е�λ��
% 
% ���룺     ch -- ԭ�ı��еĵ����ַ�
%           list -- ��Ӧԭ������codeword�е��ַ���
% �����     index -- ����list���е��±�

function index = matching(ch, list)

%��ȡ��
len = length(list);

%����
for i = 1 : len
    if(ch == list{i})
        index = i;
        return
    end
end

end