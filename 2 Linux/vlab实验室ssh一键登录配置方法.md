# vlab实验室ssh桌面一键登录配置方法

Vlab文档里说了一部分，按我说的不用看文档也行

1. 新建文件夹用于存放ssh文件
2. 打开vlab的虚拟机管理界面，就是[https://vlab.ustc.edu.cn/vm/](https://vlab.ustc.edu.cn/vm/)这个网站，点击`ssh密钥管理`，进去之后`下载私钥`，把pem文件挪到刚刚那个文件夹里，改名为`vlab.pem`，如果没改名或改了别的名，下边的命令自己记得改。
3. 按[这个链接](https://blog.csdn.net/joshua2011/article/details/90208741)把文件夹（不是文件）的权限改了。
4. 在这个文件夹里新建一个bat文件，比如`login.bat`，输入：

   ```bash
   ssh -i vlab.pem root@vlab.ustc.edu.cn
   ```

   保存。
5. 右键bat生成快捷方式到桌面，可以更名为`vlab`，还可以更改图标，比如说在[这里](https://vlab.ustc.edu.cn/)直接拖动中间那个电脑的标志下载下来，找个在线png转ico的网站转一下，把ico存在刚才那个文件夹里，然后更改图标为这个图标。
6. 这样就可以鼠标双击这个桌面图标直接连接。
7. 还可以把图标发送到任务管理器所在是上一级文件夹（一般是`C:\ProgramData\Microsoft\Windows\Start Menu\Programs`）里，这样左下角搜素输入`vlab`也能搜到运行。
