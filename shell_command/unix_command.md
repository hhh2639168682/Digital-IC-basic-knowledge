# 列出文件
**ls** 列出当前目录下的文件  
  ls -f 取消排序  
  ls -F 区分文件和文件夹  
  ls -a 显示所有文件，包括隐藏文件  
  ls -l 长列表显示，显示更多文件信息  
# 操作文件
**touch filename** 创建文件  


**cp test documents/** 复制test到document文件夹  
  cp /etc/network/*.conf ./ 复制“.conf”到当前文件夹  
  cp -r(-R) scripts/ mod_scripts 复制“scripts”下所有内容到“mod_scripts”下  


**ln -s** 软链接
ln -s /big_drive/waveforms /small_drive/simulation/waveforms  在小硬盘中仿真，把波形存到大硬盘  


**mv file1 /path/** 把file1移动到path中  
  mv a.txt b.txt 把a.txt重命名为b.txt  
  mv -i a.txt b.txt 重命名前有提示  


**rm file1** 删除file1  
rm -r document/ 删除文件夹  
rm -i document/删除文件会有提示  
rm  *.txt 删除所有后缀为.txt的文件  
rm  -rf document 遇到异常不提示  
# 操作文件夹
**.** 表示当前目录  
cp ~/test.txt . 把home目录下的test.txt 复制到当前目录  


**..** 表示上一级目录  
cp ./test.txt .. 把home目录下的test.txt 复制到上一级目录  


**mkdir newdir** 创建文件夹  
# 查看文件夹
**file file1** 显示文件/文件夹属性 


**cat file1** 显示文件全部内容
cat -n file1 显示文件全部内容,带上行号  
cat -b file1 显示文件全部内容,带上行号,空白行不带


**more** **less** 分屏显示的内容，会在当前屏幕下显示百分比  


**tail file1** 显示文件最后10行 
**tail -n 20 file1** 显示文件最后20行  


**head file1** 显示文件前10行  
**head -n 20 file1** 显示文件前20行

# 进程
**ps** 查看当前terminal的进程  
**ps -f** 显示当前terminal详细进程  


**top**  实时显示监控进程变化  
**top -u chrishhh** 实时显示该用户情况  

**kill pid_num**  中止进程  
**kill -9 pid_num**  强行中止进程


**df -h**  显示硬盘大小和使用量  
**du** 显示某一个文件夹或者文件大小    
**du -sh** “-s”选项控制不显示各子文件夹大小，只显示第一层大小；  
“-h”按用户可读方式显示

# 数据操作
**grep [options] pattern [file]**  查找数据


**grep -v ok file1** 在file1中找**不存在**“ok”的行


**grep -n ok file*** 在当前目录下所有以 “file” 开头的文件中搜索包含“ok”的行，并打印这些行及其所在的行号。  


加上*会遍历所有的以file开头的文件，不加只查找显示“file”文件

**grep “[0-9]\+” ok*** 在文件 file 中搜索包含一个或多个连续数字的行，并打印出这些行。

# 解压缩
**tar -cvf test.tar test1/ test2/**  把文件夹test1和test2打包成test.tar

**tar -xvf test.tar**  把test.tar解压










