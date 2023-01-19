# 第22章 软件安装RPM、SRPM与YUM

基于 Linux 的软件安装方式（两种）：

- dpkg 由 Debian Linux 开发，包括 B2D Ubuntu 都能使用。
- RPM (RedHat Package Manager) 由 Red Hat 开发，包括 Fedora Centos SUSE 等都使用这种。

软件信息：

- `/etc` 一些配置文件
- `/usr/bin` 一些可执行文件
- `/usr/lib` 动态函数库
- `/usr/share/doc` 软件使用手册和说明文件
- `/usr/share/man` 一些 man page 文件

rpm 命令

- `rpm -q` 查询软件的各种信息
- `rpm -V` 查询软件是否被修改过

yum 命令

- `yum -y` 全选 yes
- `yum search` 寻找某个软件
- `yum list` 列出所有 yum 管理的文件
- `yum remove` 删除某个软件
