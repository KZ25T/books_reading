# 第21章 软件安装：源代码与Tarball

## 关于makefile

变量优先

1. make 命令行后边加上的环境变量优先
2. makefile 里指定的变量第二
3. shell 系统环境变量第三

特殊的变量： `$@` 为指定目标

## patch更新

patch：patch -p代表拿掉几个斜线来更新文件。

## 加密校验

md5sum sha1sum sha256sum 是常见的校验方式。

- `-b` 使用二进制读取校验
- `-c` 检验文件校验值
- `-t` 以文本文件读取校验值
