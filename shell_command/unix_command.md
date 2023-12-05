# unix_command

# 列出文件
**ls** 列出当前目录下的文件  
  ls -f 取消排序  
  ls -F 区分文件和文件夹  
  ls -a 显示所有文件，包括隐藏文件  
  ls -l 可以显示更多信息，包括文件权限
  
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
rm -i document/ 删除文件会有提示  
rm  *.txt  删除所有后缀为.txt的文件  
rm  -rf document  遇到异常不提示  


# 操作文件夹
**.** 表示当前目录  

cp ~/test.txt . 把home目录下的test.txt 复制到当前目录  

**..** 表示上一级目录  

cp ./test.txt .. 把home目录下的test.txt 复制到上一级目录  

**mkdir newdir** 创建文件夹  


# 查看文件夹
**file file1** 显示文件/文件夹属性 

**cat file1** 显示文件全部内容
**cat -n file1** 显示文件全部内容,带上行号  
**cat -b file1** 显示文件全部内容,带上行号,空白行不带

**more** **less** 分屏显示的内容，会在当前屏幕下显示百分比  

**tail file1** 显示文件最后10行 
**tail -n 20 file1** 显示文件最后20行  

**head file1** 显示文件前10行  
**head -n 20 file1** 显示文件前20行

**wc -l test.txt** 显示test.txt文件行数
**split -d -l 1000000 test.txt** 拆分文件为100w行一份

**find dir* -name "test"** 在所有dir为前缀的目录中找名为test的文件

# 进程
**ps** 查看当前terminal的进程  
**ps -f** 显示当前terminal详细进程  

**top**  实时显示监控进程变化  
**top -u chrishhh** 实时显示该用户情况  

**kill pid_num**  中止进程  
**kill -9 pid_num**  强行中止进程


# 文件大小使用
**df -h**  显示硬盘大小和使用量  
**du** 显示某一个文件夹或者文件大小    
**du -sh** “-s”选项控制不显示各子文件夹大小，只显示第一层大小；  
           “-h”按用户可读方式显示


# 数据操作
**grep [options] pattern [file]**  查找数据

**grep -v ok file1** 在file1中找**不存在**“ok”的行

**grep -n ok file*** 在当前目录下所有以 “file” 开头的文件中搜索包含“ok”的行，并打印这些行及其所在的行号。  
加上*会遍历所有的以file开头的文件，不加只查找显示“file”文件

**grep -c ok file** 在file中找存在ok的行，仅仅显示行个数，不显示行内容

**grep -e ok1 -e ok2 file** 在file中找存在ok1和ok2的行

**grep -r ok*** 在当前运行目录递归遍历所有的文件目录和子目录查找ok

**grep “[0-9]\+” ok*** 在文件 file 中搜索包含一个或多个连续数字的行，并打印出这些行。

**grep ok test* > output.txt** 在所有test为前缀的文件中搜索ok，并把匹配的行内容输出到文件output.txt

# 解压缩
**tar -cvf test.tar test1/ test2/**  把文件夹test1和test2打包成test.tar

**tar -xvf test.tar**  把test.tar解压


# 其他操作
**history** 列出最近执行过的命令

**alias la='ls -A‘** 为'ls -A'命名起别名为la

**which vivado** 查找vivado软件路径

**>** 输出到xxx

**>>** 追加输出到文件

**echo $var>>output.txt** 把环境变量var的值追加输出到output.txt

**|** 管道符，将一个操作的输出送到另一个操作做输入

**cut -c 2-5** 截取前2-5个字符，常用于识别当前工作站名称

# 设置全局变量
**setnv proj_root ~/proj/test** 将‘/home/proj/test’路径设置为proj_root

**cd $proj_root/tb** 进入‘home/proj/test/tb

# 用户名
**su user1**更改到user1

**passwd**修改工作站密码 

# terminal

**crtl+a** 到命令行头

**crtl+e** 到命令行尾

**man cp** 列出所有命令的用法和参数











