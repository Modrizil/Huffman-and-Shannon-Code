% txt_decode ������������ȫ�ĵı�������ԭ��
% 
% ���룺     txt_code -- ȫ�ĵı���
%           codeword -- ��Ӧ�ı��뷽ʽ
% �����     txt -- �����Ľ��


function txt = txt_decode(txt_code, codeword)

%��ȡ���볤
code_len = length(txt_code);
list = codeword(:, 3);
%����ԭ���ı�txt�������ַ�ch
txt = [];
ch = [];

%����
for i = 1 : code_len
    %��ȡ��ǰǰ׺��
    ch = [ch, txt_code(i)];
    index = matching(ch, list);%�����Ӻ���matching��Ѱ�Ҷ�Ӧ���±�
    
    %����ҵ���Ӧ�±꣬�����ԭ��
    if(~isempty(index))
        txt = [txt, codeword{index,1}];
        ch = [];
    end
    
    %��������ַ���Ӧ�����ֳ���15λ����˵��������󣬷���debug
    if(length(ch) >= 15)
        error(num2str(i));
    end
end

end


% matching Ϊtxt_decode���Ӻ����������ӱ���������Ӧ���е�λ��
% 
% ���룺     code -- ԭ�ı������е�����
%           list -- ��Ӧԭ������codeword�е����ֱ�
% �����     index -- ����list���е��±�

function index = matching(code, list)

index = [];
%��ȡ��
len = length(list);

%����
for i = 1 : len
    if(strcmp(code, list{i}))
        index = i;
        return;
    end
end

end