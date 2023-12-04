# 列出文件
**ls** 列出当前目录下的文件  
'  'ls -f 取消排序  
  ls -F 区分文件和文件夹  
  ls -a 显示所有文件，包括隐藏文件  
  ls -l 长列表显示，显示更多文件信息  
# 操作文件
**touch filename** 创建文件  


**cp test documents/** 复制test到document文件夹  
  cp /etc/network/*.conf ./ 复制.conf到当前文件夹  
  cp -r(-R) scripts/ mod_scripts 复制scripts下所有内容到mod_scripts下  


**ln -s** 软链接
例如 ln -s /big_drive/waveforms /small_drive/simulation/waveforms  在小硬盘中仿真，把波形存到大硬盘  


**mv file1 /path/** 把file1移动到path中  
  mv a.txt b.txt 把a.txt重命名为b.txt  
  -i 重命名前有提示  


**rm file1** 删除file1  
&nbsp;&nbsp;rm -r document/ 删除文件夹  
&nbsp;&nbsp;&nbsp;-i 删除文件会有提示  
&nbsp;&nbsp;rm  *.txt 删除所有后缀为.txt的文件  
&nbsp;&nbsp;rm  -rf document 遇到异常不提示  
# 操作文件夹
**.** 表示当前目录  
例如 cp ~/test.txt . 把home目录下的test.txt 复制到当前目录  


**..** 表示上一级目录  
例如 cp ./test.txt .. 把home目录下的test.txt 复制到上一级目录  


**mkdir newdir** 创建文件夹  
# 查看文件夹
**file file1** 显示文件/文件夹属性 


**cat file1** 显示文件全部内容
&nbsp;&nbsp;cat -n file1 显示文件全部内容,带上行号  
&nbsp;&nbsp;&nbsp;-b 空白行不带


