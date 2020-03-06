% txt_decode 函数用来根据全文的编码解码出原文
% 
% 输入：     txt_code -- 全文的编码
%           codeword -- 对应的编码方式
% 输出：     txt -- 译码后的结果


function txt = txt_decode(txt_code, codeword)

%获取总码长
code_len = length(txt_code);
list = codeword(:, 3);
%创建原文文本txt，单个字符ch
txt = [];
ch = [];

%译码
for i = 1 : code_len
    %获取当前前缀码
    ch = [ch, txt_code(i)];
    index = matching(ch, list);%调用子函数matching，寻找对应的下标
    
    %如果找到对应下标，则更新原文
    if(~isempty(index))
        txt = [txt, codeword{index,1}];
        ch = [];
    end
    
    %如果单个字符对应的码字超过15位，则说明译码错误，方便debug
    if(length(ch) >= 15)
        error(num2str(i));
    end
end

end


% matching 为txt_decode的子函数，用来从表中搜索对应表中的位置
% 
% 输入：     code -- 原文本编码中的码字
%           list -- 对应原函数中codeword中的码字表
% 输出：     index -- 返回list表中的下标

function index = matching(code, list)

index = [];
%获取表长
len = length(list);

%查找
for i = 1 : len
    if(strcmp(code, list{i}))
        index = i;
        return;
    end
end

end