%main Ϊ��ִ�нű�������main���ɻ��ԭ�Ķ�Ӧ�Ĺ��������롢��ũ���룬
%     ���õ�ȫ�ĵı��룬���б���������֤


%-----------------------�ļ�����----------------------------------
filename = 'Steve_Jobs_Speech.txt';

[txt, list] = fileProcess(filename);

%-----------------------�����غ��볤-------------------------------
H = calcEntropy(list);

%Hcodeword �����������Ӧ�����ֱ�
Hcodeword = Huffman(list);
HAverCodeLen = calcAverCodeLen(Hcodeword);

%Scodeword ��ũ�����Ӧ�����ֱ�
Scodeword = Shannon(list);
SAverCodeLen = calcAverCodeLen(Scodeword);

%-----------------------��ʾ�غ��볤-------------------------------
disp('Entropy and Average code length:')
fprintf('\t%s\t%s\t%s\n', 'Entropy', 'Huffman', 'Shannon');
fprintf('\t%3.3f\t%3.3f\t%3.3f\n', H, HAverCodeLen, SAverCodeLen);

%-----------------------�õ�ԭ�ĵĹ���������ũ����--------------------
txtcode_H = txt_encode(txt, Hcodeword);
txtcode_S = txt_encode(txt, Scodeword);

%-----------------------���ñ�����֤�Ƿ�����ȷ����--------------------
txttest_H = txt_decode(txtcode_H, Hcodeword);
txttest_S = txt_decode(txtcode_S, Scodeword);

%-----------------------��ʾ������ȷ��------------------------------
disp('Decoding Correctness:')
fprintf('\t%s\t%s\n', 'Huffman', 'Shannon');
fprintf('\t%d\t%d\n',strcmp(txt,txttest_H), strcmp(txt, txttest_S));


