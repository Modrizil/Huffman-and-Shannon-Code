# Huffman code and Shannon code(哈夫曼码、香农码)

matlab仿真。测试文本*Steve_Jobs_Speech.txt*



### 程序  

**主程序**    

`main` 为可执行脚本，直接运行即可得到原文对应的哈夫曼编码、香农编码，并得到全文的编码，进行编码译码验证   



**哈夫曼编码**：  

`Huffman` ：  
Huffman 函数用来对于给定数据进行哈夫曼编码   
输入：         list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率  
输出：         codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的哈夫曼编码  

`Update` ：  
函数 Update 为函数Huffman的子函数，用于更新数据  
输入：         codeword -- 各个不同字符对应的有待更新的码字  
              Pr -- 子节点还未合并的概率  
              group -- 需要更新的下标类  
              index -- 输入两个需要更改的group下标   
输出：         codeword -- 更新完后的码字  
              group -- 更新完后的下标分类  
              Pr -- 更新完后的概率  



**香农编码**：  

`Shannon` ：  
函数 Shannon 用来对字符创建香农编码  
输入：         list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率  
输出：         codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的香农编码  



**其他**：  

`fileProcess` ：  
fileProcess  函数用来处理输入的txt文件，得到文本数据和对应的字母表单  
输入：        filename -- 文件的名称（格式：字符串）  
输出：        txt -- 源文件的文本字符串  
             list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率  

`calcEntropy` ：  
calcEntropy  函数用来计算给定数据的信息熵  
输入：        list -- cell数组，第一列为不同的字符，第二列为对应出现在文本中的概率  
输出：        H -- 信息熵  

`calcAverCodeLen` ：  
calcAverCodeLen 函数用来计算编码的平均码长  
输入：        codeword -- cell数组，第一列为不同的字符，第二列为对应的概率，第三列为该字符的哈夫曼编码  
输出：        averLength -- 字符编码的平均码长  

`txt_encode` ：  
txt_encode 函数用来把给定文本按照特定的编码方式编码  
输入：        txt -- 原文本（格式：字符串）  
             codeword -- 对应字符的码字表  
输出：        total -- 总文本的编码结果  

`txt_decode` ：  
txt_decode 函数用来根据全文的编码解码出原文  
输入：        txt_code -- 全文的编码  
             codeword -- 对应的编码方式  
输出：        txt -- 译码后的结果  
