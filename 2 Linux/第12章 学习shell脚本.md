# 第12章 学习shell脚本

source是在当前shell下运行，其他为子进程运行

test命令：检查文件是否存在，命令是否是某个值
- `-e` 存在
- `-f` 存在是文件
- `-d` 存在是目录
- `-nt` 新于某个文件，对应 `-ot`
- `-ef` 是同一个文件（硬链接）

也可以用中括号（注意空格）判断。
