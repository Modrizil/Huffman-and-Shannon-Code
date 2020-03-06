%main 为可执行脚本，运行main即可获得原文对应的哈夫曼编码、香农编码，
%     并得到全文的编码，进行编码译码验证


%-----------------------文件处理----------------------------------
filename = 'Steve_Jobs_Speech.txt';

[txt, list] = fileProcess(filename);

%-----------------------计算熵和码长-------------------------------
H = calcEntropy(list);

%Hcodeword 哈夫曼编码对应的码字表
Hcodeword = Huffman(list);
HAverCodeLen = calcAverCodeLen(Hcodeword);

%Scodeword 香农编码对应的码字表
Scodeword = Shannon(list);
SAverCodeLen = calcAverCodeLen(Scodeword);

%-----------------------显示熵和码长-------------------------------
disp('Entropy and Average code length:')
fprintf('\t%s\t%s\t%s\n', 'Entropy', 'Huffman', 'Shannon');
fprintf('\t%3.3f\t%3.3f\t%3.3f\n', H, HAverCodeLen, SAverCodeLen);

%-----------------------得到原文的哈夫曼和香农编码--------------------
txtcode_H = txt_encode(txt, Hcodeword);
txtcode_S = txt_encode(txt, Scodeword);

%-----------------------利用编码验证是否能正确译码--------------------
txttest_H = txt_decode(txtcode_H, Hcodeword);
txttest_S = txt_decode(txtcode_S, Scodeword);

%-----------------------显示译码正确性------------------------------
disp('Decoding Correctness:')
fprintf('\t%s\t%s\n', 'Huffman', 'Shannon');
fprintf('\t%d\t%d\n',strcmp(txt,txttest_H), strcmp(txt, txttest_S));


