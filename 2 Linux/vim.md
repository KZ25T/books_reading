# vim的常用命令

## 进入插入模式

a append after char
i insert before char
o open a line below
A append after line
I insert before line
O open a line above

ctrl+[ 退出插入模式
gi 回到上一次插入的地点

## 命令行模式

sp 横分屏
vs 竖分屏
:q 退出当前分屏
:set nu 开启行号
:set nonu 关闭行号
%s/stringA/stringB/g 全局替换

## Visual模式

小v选中部分文段，大V选中整行

^V长方形选择

- +d delete 删除
- +y yank 复制

## 插入模式

- `^h` 删除上一个字符
- `^w` 删除前一个单词
- `^u` 删除当前行

## 快速移动方法

normal光标使用hjkl光标（左、下、上、右）

单词单位移动

- w和W移动到下一个word/WORD开头
- e和E移动到下一个word/WORD尾
- word指非空白符分割的代词，WORD指空白符分割的单词
- b和B移动到上一个word/WORD开头
- f+char跳转到行内下一个该char上，t是前边。
  - F表示反过来搜索
  - 第一次没搜到可以用分号和逗号搜索上一个或下一个
- 水平移动：0移动到行首，^移动到第一个非空白字符
  - $移动到行尾
- 垂直移动：()在句子中移动，{}在段落中移动
- 页面移动：gg到文件开头，GG为结尾，^O移动到之前的位置
- Head/Middle/Lower移动到页面开头、中间、尾部
- ^u ^f表示向上和向下翻页

## 测试区域

ijshaocnpoicn
whqiunqnwi
