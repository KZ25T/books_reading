# 第7章 Linux磁盘与文件系统管理

操作系统的文件除了实际内容，还有文件权限和属性等信息。Linux议案会放在不同区块，数据在数据区块，权限等在inode中。还有超级区块记录整个文件系统的整体信息，包括inode和数据区块的总量、剩余量、使用量等。

U盘的文件系统一般为FAT格式，并没有inode的存在，读取完整个区块之后才能读取下一个，容易造成碎片，需要及时进行碎片清理。

## ext2文件系统

ext2文件系统格式化的时候基本上是区分为多个区块群组，每个区块群组都有独立的inode、数据区块、超级区块系统。

inode区块记录了文件权限、属性，有12个直接、1个间接、1个双间接、1个三间接数据。因此但以文件最大大小为：12+256+256\*256+256\*256\*256(K)=16GB

超级区块记录数据除了包括上面所属，还有文件系统挂载时间、最近一次写入数据的时间、最近一次校验磁盘的信息，以及有效位（未挂载为1）等。

日志式文件系统：为了避免不一致现象发生，所以在文件系统中规划一个区块，专门记录写入或修改文件的步骤，可以简化一致性检查。

## 文件系统的运行

读写文件时会放入内存，过段时间会将`Dirty`文件写回存储。

## 挂载点的意义

挂载点是一个目录，是进入这个文件系统的入口。

## 其他Linux支持的文件系统与VFS

常见支持的文件系统：

- 传统文件系统：`ext2`、`minix`、`FAT`、`iso9660`等
- 日志式文件系统：`ext3`、`ext4`、`NTFS`等
- 网络文件系统：`NFS`、`SMBFS`

VFS系统：

Linux内核中有一个叫VFS的功能读取文件系统。

## XFS文件系统简介

XFS比较适合现代的大容量的磁盘和巨大的文件，已经取代ext成为新的Linux的默认文件系统。

XFS在数据分布上分为数据区、文件系统活动登录区和实时运行区。

- 数据区
  - 和ext系列差不多，包括inode、数据区块、超级区块等数据。
  - 数据区也是分为了多个存储区群组来放置文件系统所需要的数据，每个村出去群组包括文件其他的超级区块、剩余空间的管理机制、inode的分配与追踪。
  - inode和区块都是系统需要的时候产生的，所以格式化超级快。
  - xfs的区块和inode都有多种不同容量可供设置，区块容量可以在512B到64KB中调整（实际上在Linux中最多只给4K），inode可以在256B到2MB
- 文件系统活动登录区
  - 有点像日志区
  - 甚至可以指定外部磁盘作为xfs的日志区块
- 实时运行区
  - 当有文件要被建立时，xfs会在这个区段找到几个extent区块，将文件放置在这个区块内，分配完毕后再写入到data section的inode区块中。
  - 这个区块需要在初始化时指定。

## 文件系统的简单操作

### 磁盘与目录的容量

- `df`查看文件系统的整体磁盘使用量
  - `-h`用GB、MB等单位显示
  - `-i`不用磁盘容量，用inode的数量显示

### 硬链接与符号链接

- 硬链接
  - 每条目录下新增一个文件名链接到相同的inode号码的关联记录
  - 改变链接值，磁盘空间和inode的数目都不改变
  - 删除一个链接不会删除这个文件，除非删除所有链接
  - 不能跨文件系统，不能链接目录
  - 使用命令：`ln source dest`
  - 个人测试结果
    - 文件属性中没有`l`
    - 感觉源文件和链接生成具有同等地为
- 符号链接
  - 建立一个独立的文件，会让数据的读取指向它链接的文件名
  - 利用文件作为指向的操作
  - 源文件被删除，符号链接打不开
  - 不改变链接值，文件属性有`l`
  - 类似Windows的快捷方式
  - 命令：`ln -s source dest`
- 新建一个目录，新的目录链接数为2（`dir`和`dir/.`），上级目录连接数增加1（`dir/..`）

## 磁盘的分区、格式化、检验和挂载

`lsblk`列出所有存储设备

### 特殊设备loop挂载

如果有光盘镜像文件或者使用文件作为磁盘的方式，则可以通过特别多方法挂在起来，不需要刻录。

## 文件系统的特殊观察与操作
