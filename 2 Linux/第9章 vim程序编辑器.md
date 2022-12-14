# 第9章 vim程序编辑器

## vi的三种模式

- 一般命令模式：以vi打开文件进入一般命令模式。可以复制、粘贴等，但是不能直接编辑。
- 编辑模式：一般命令模式按下`i`、`o`、`a`、`r`等键才能进入。按下Esc退出。
- 命令行模式：在一般命令模式下按下`:`、`/`、`?`键可以进入命令行模式。

（注：较新版本的vi命令已经被vim替代。书上的vi路径不适合学校的虚拟机，应该当使用`/usr/bin/vi`执行。）

## 一般命令模式

- 移动
  - `数字 ↑`等键可以选定换行次数。
  - `[Ctrl]+f`向上翻页
  - `[Ctrl]+b`向下翻页
  - `数字+G`移动到文件的某一行
- 查找替换
  - `/word`光标之后寻找这个字符串
  - `?word`光标之前寻找这个字符串
  - `n`向下查找（我实践结果和书上的不一样）
  - `N`向上查找
  - `:1,$s/word1/word2/g`全文查找字符串word1并替换为word2；结尾加c用户确认。
- 删除、复制与粘贴
  - `dd`剪切光标所在的一行
  - `yy`复制光标所在的一行
  - `nyy`复制光标向下的n行
  - `y0`复制光标所在的字符到行首的数据
  - `y$`复制光标所在字符到行尾的数据
  - `p与P`p粘贴在下一行，P粘贴在上一行
  - `u`恢复上一个操作
  - `[Ctrl]+r`重做上一个操作
  - `.`重复前一个操作
- 进入编辑模式
  - `i`等进入插入模式
  - `r`进入替换模式
  - `Esc`退出
- 进入命令行模式
  - `w [filename]`写入一个新文件（另存为）
  - `set nu`显示行号
  - `:q!`不保存退出

## 多文件

记不住，不如到时候现查

## 中文编码

vim界面默认使用UTF-8

终端修正编码方式：

```bash
LANG=zh_CN.gb18030
export LC_ALL=zh_CN.gb18030
```
