# 第16章 进程管理与SELinux内核

`command &` 后台执行命令
正在执行的命令按 `Ctrl+Z` 暂停

- `jobs` 查看后台任务状态
  - `-l` 列出PID号码
  - `-r` 仅列出后台run的任务
  - `-s` 仅列出后台stopped的任务
- `fg %number` 把上边列出的数字拿到前台运行
- `bg %number` 把上边列出的任务放到后台运行
- `kill -9 %number` 强制关闭某个任务
  - `-2` 键盘输入 `Ctrl+C`
  - `-15` 以正常方式终止某个任务
- `nohup program &` 与终端无关，程序放到后台执行，关闭终端不会停止程序
- `ps`
  - `-l` 列出与你的操作环境有关的进程
  - `aux` 列出详细信息
- `pstree` 列出进程间关系
- `top` 实时输出进程信息
  - 输入 `k` 或 `r` 出现kill信息

进程的信号

|代号|名称|内容|
|-|-|-|
|1|SIGHUP|启动被终止的进程|
|2|SIGINT|Ctrl+C中断|
|9|SIGKILL|强制中断|
|15|SIGTERM|正常方式结束|
|19|SIGSTOP|Ctrl+Z暂停|

- `kill -signal commandname` 关闭某命令
  - `-i` 交互

nice值：

- PRI(new)=PRI(old)+nice
  - nice从-20到19
  - PRI越小越优先

- free 查看系统内存使用情况
- uname 查看系统与内核相关信息
- uptime 查看系统启动时间与任务负载
- netstat 追踪网络或socket文件

/proc/number 记录number进程的信息

- /proc/cmdline 加载内核时所执行的相关命令与参数
- /proc/cpuinfo CPU相关信息
- /proc/devices 各个主要设备的设备代号

## SELinux初探

MAC： 强制访问控制，针对特定的进程与特定的文件资源来管理权限

SELinux的运行模式

- 主体：进程
- 目标：文件系统
- 策略：根据某些服务来制定对应的安全策略

安全上下文分三段：身份识别:角色:类型

- 身份：unconfined_u 不受限的用户； system_u 系统用户
- 角色：object_r 文件或目录等资源； system_r 进程
- 类型：在文件资源上称为类型，在主体进程则成为域
