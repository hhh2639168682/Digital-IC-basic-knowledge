# clka<clkb 慢到快
**单bit**

两级触发器同步

**多bit** 

引入使能信号；多bit同步器
![multi bits](https://github.com/hhh2639168682/Digital-IC-basic-knowledge/blob/main/multi_bits_input/answer_multibits.png "multi bits")

# clka>clkb 快到慢
**单bit** 

脉冲同步器（翻转电路）：
总体思路是将A时钟域的脉冲信号转换为电平信号，打两拍后再转换为B时钟域的脉冲信号

**多bit**  

握手机制，异步FIFO
![A_fifo](https://github.com/hhh2639168682/Digital-IC-basic-knowledge/blob/main/interview/801B0340EAA7D418025E65E160ADE22B.png "A_fifo")
