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

握手机制

异步FIFO
![A_fifo](https://github.com/hhh2639168682/Digital-IC-basic-knowledge/blob/main/interview/801B0340EAA7D418025E65E160ADE22B.png "A_fifo")
1. 第1部分是双口RAM，用于数据的存储。

2. 第2部分是数据写入控制器

3. 第3部分是数据读取控制器

4. 读指针同步器

   使用写时钟的两级触发器采集读指针，输出到数据写入控制器。

5. 写指针同步器

   使用读时钟的两级触发器采集写指针，输出到数据读取控制器。

6. 空满判断
当读写地址的格雷码仅有最高的2bit不同时，FIFO满；当读写地址完全相同时，FIFO空。
