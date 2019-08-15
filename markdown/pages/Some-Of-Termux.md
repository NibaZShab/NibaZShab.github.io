---
title: 终端termux的一些配置
date: 2019-08-09 09:50:16
---

![](/markdown/pictures/04.png)

强大的终端模拟器，适合不喜欢图形界面的命令行爱好者

# 简介
---  

``Termux``是一个``Android``下一个高级的终端模拟器，开源且不需要``root``,支持``apt``管理软件包，十分方便安装软件包,完美支持``Python``,``PHP``,``Ruby``,``Go``,``Nodejs``,``MySQL``等 
  
• 享受``bash``和``zsh``  
• 使用``nano``和``vim``编辑文件  
• 通过``ssh``访问服务器  
• 使用``gcc``和``clang``编译代码  
• 使用``python``控制台来作为口袋计算器 
• 使用``git``和``subversion``检查项目  
• 使用``frotz``运行基于文本的游戏

## 下载地址
* [酷安](https://www.coolapk.com/apk/com.termux)
* [官网](https://termux.com/)
* [第三方交流群](https://qm.qq.com/cgi-bin/qm/qr?k=awfcuUyzZcGk2xDZDAa3o54Fa6mTRIKK&authKey=ye2B2HaUpzQ6ZUtJCW%2BNQlX0g3y1bSfB1WYtXkSb%2BPr1B%2BG1pCXImwRDO9FWMhn8#)
* [github开源地址](https://github.com/termux/termux-app)
* [Google Play下载地址](https://play.google.com/store/apps/details?id=com.termux)

# 基本命令
这里主要提一下``pkg``命令，简单介绍一下，如下：
```sh
pkg search <query>            搜索包
pkg install <package>         安装包
pkg uninstall <package>       卸载包
pkg reinstall <package>       重新安装包
pkg update                    更新源
pkg upgrade                   升级软件包
pkg list-all                  列出可供安装的所有包
pkg list-installed            列出已经安装的包
pkg shoe <package>            显示某个包的详细信息
pkg files <package>           显示某个包的相关文件夹路径
```

# 基本操作
## 从屏幕左往右划
可以添加新的终端窗口，显示隐藏快捷键，给窗口改名

![](/markdown/pictures/05.png)

## 自定义快捷键
添加快捷键需要修改``$HOME/.termux/``下的``termux.properties``文件，这里提供一份完整的官方快捷键
```sh
mkdir $HOME/.termux
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" >> $HOME/.termux/termux.properties
```

![](/markdown/pictures/06.png)

# 更换为国内源
因为某些众所周知的原因，官方源非常的慢，所以需要切换为国内的源，推荐清华大学源

## 官方的解决方法
设置默认编辑器
```sh
export EDITOR=vi
```
编辑源文件
```sh
apt edit-sources
```
将原来的``https://termux.net``替换为``http://mirrors.tuna.tsinghua.edu.cn/termux``  
  
保存并退出

## 直接编辑源文件
官方的方法比较麻烦，这里推荐一个更简单的方法
```sh
vi  $PREFIX/etc/apt/sources.list
```

![](/markdown/pictures/08.png)

# 目录环境结构
```sh
~ > echo $HOME
/data/data/com.termux/files/home

 ~ > echo $PREFIX
/data/data/com.termux/files/usr

 ~ > echo $TMPPREFIX
/data/data/com.termux/files/usr/tmp/zsh
```
这个HOME路径看上去不太一样,为了方便,``Termux``提供了一个特殊的环境变量``PREFIX``

![](/markdown/pictures/07.png)

# Termux优化
首先，我们先申请一下储存权限，Android6.0以上会出现弹窗确认授权
```sh
termux-setup-storage
```

![](/markdown/pictures/09.png)

## 创建储存软连接
这里就用系统默认的``Pictures``文件夹来做个例子
```sh
ln -s /data/data/com.termux/files/home/storage/shared/Pictures Pictures
```

![](/markdown/pictures/10.png)

这样可以直接在``home``目录下去访问``Pictures``文件夹,非常方便文件的传输，大大提升了工作效率

## 修改启动问候语
默认的问候语如下图：

![](/markdown/pictures/11.png)

当我们用了一段时间的``Termux``之后，也许会想要自定义一下启动问候语，这时候就可以这样  
编辑问候语文件直接修改：
```sh
vim $PREFIX/etc/motd
```
修改完的效果如下：

![](/markdown/pictures/12.png)

# 管理员身份
在进行终端操作时，我们难免会遇到需要管理员权限的问题，在管理员身份下，输入``exit``可回到普通身份
## 没有ROOT
利用``proot``工具来模拟某些需要``root``的环境
```sh
pkg install proot
```
然后在终端输入如下指令：
```sh
termux-chroot
```
即可模拟``root``环境
在这个``proot``环境下面,相当于是进入了``home``目录,可以很方便地进行一些配置
## 已经ROOT
由于直接输入``su``会导致一些功能丢失，所以我们采用``Termux``专求的``tsu``来代替``su``
```sh
pkg install tsu
```
然后输入：
```sh
tsu
```
即可切换为``root``用户，若弹出``root``授权提示，点击确认即可

# 编辑器
终端下有``vim``神器,并且官方也已经封装了``vim-python``,对``vim``进行了``Python``相关的优化
```sh
pkg install vim-python
```
## 解决vim中文乱码
在 HOME 目录下，新建一个`` vimrc``文件
```sh
vim .vimrc
```
添加以下内容进去：
```sh
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
```
## 解决vim折行，不显示行号
```sh
vim .vimrc
```
添加下列内容：
```sh
set nu
set nowrap
```
最后``source``下变量
```sh
source .vimrc
```
效果图：

![](/markdown/pictures/13.png)

# 使用Aria2下载文件
Aria2是一个轻量级多协议和多源命令行下载实用工具。它支持 HTTP / HTTPS, FTP, SFTP, bt 和 Metalink。通过内置 Aria2 可以操作 json - rpc 和 xml - rpc
### 安装aria2
```sh
pkg install aria2
```
### 本地启动
```sh
aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c
```
这个``rpc``服务模式监听的是``6800``端口，方便接下来的 Web 界面的操作

## webui-aria2
这是个 Aria2 的热门项目，把 Aria2 封装在了 Web  平台，便于操作和管理
```sh
git clone https://github.com/ziahamza/webui-aria2.git
cd webui-aria2
node node-server.js
```
使用效果图，亲测挺好用的：

![](/markdown/pictures/14.png)

# 终端二维码
Linux 命令行下的二维码，主要核心是这个网址：``http://qrenco.de/``
**注：``"``和``"``之间可以填写任意字符**
```sh
echo "http://qrenco.de/" |curl -F-=\<- qrenco.de
```
![](/markdown/pictures/15.png)
如果你不嫌无聊的话还可以扫一下这个二维码，然后就打开我的博客了

# 计算圆周率
一个计算圆周率``π``的小代码，用``4``个核心来计算``π``小数点后``10000``位，通过比较所耗时间长短来比较性能
```sh
pkg install bc
time echo "scale = 10000;4 * a(1)" | bc -l
```
![](/markdown/pictures/17.png)

我这里计算的是小数点后``1000``位，计算``10000``位毕竟消耗时间，懒得等

# 刷流量
这是一个刷流量的指令，会一直消耗你的流量，我也不知道为啥要刷流量，有什么意义吗？
```sh
i=0
while [ $((i++)) -le 999 ]
do
wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk 
done
```
``/dev/null``是手机上的一个目录，类似于``linux黑洞``，所有指向这个路径的文件都会消失  
  
注：后面那个``https://dlie5.myapp.com/m.......``是一个下载链接，可以自己替换掉

# 终端版百度云
这个百度云叫``BaiduPCS-Go``, 是一个仿``linux``的``shell``命令处理的终端版百度云，原来是可以做到不限速下载百度云的，由于在去年百度官方与开发者进行了一番深切交谈，弃坑了，具体的安装方式可以去他的``github``看看  
**[我是传送门](https://github.com/iikira/BaiduPCS-Go/blob/master/README.md)**  
  
这里提供一份自己写的安装脚本
```bash
#!/bin/bash
echo "
****************************************************
*
*   BaiduPCS-Go  - i ikira
*
*      Windows
*      Linux / macOS
*      Android / iOS
*
*   https://github.com/iikira/BaiduPCS-Go/
*
****************************************************
"
action1()
{
   echo "Goodbye"
}
action2()
{
   apt update && apt upgrade -y
   apt install zip wget -y
   termux-setup-storage
   wget -O 1.zip https://github.com/iikira/BaiduPCS-Go/releases/download/v3.5.6/BaiduPCS-Go-v3.5.6-android-21-arm64.zip
   unzip 1.zip && rm 1.zip
   mv BaiduPCS-Go-v3.5.6-android-21-arm64 BaiduPCS-Go
   echo "cd ~/BaiduPCS-Go && ./BaiduPCS-Go" >> $PREFIX/bin/bdy
   chmod 777 $PREFIX/bin/bdy
   echo "
****************************************************
*
*   如需使用百度输入法的接口，则配置如下:
*
*     config set -appid=310646
*     cd /apps/baidu_shurufa
*     config set -appid=265486
*     config set -savedir /sdcard/Download
*
*
****************************************************

****************************************************
*
*    输入 bdy 开始食用
*
****************************************************
"
}
read -p " 
Do you want to continue? [Y/n] " choose
if [ $choose = "n" ]
then
    action1
fi
if [ $choose = "y" ]
then
    action2
fi
```

![](/markdown/pictures/18.png)

---
# 完
注：文章部分内容转自[Termux 高级终端安装使用配置教程](https://www.sqlsec.com/2018/05/termux.html)
