---
title: 终端termux的一些配置
date: 2019-08-09 09:50:16
---

![](/markdown/pictures/04.png)

高级终端``Termux``是个强大的终端模拟器，这样的应用应该特别适合不喜欢图形界面的命令行爱好者

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
快捷键是``$HOME/.termux/``下的``termux.properties``文件，可以修改它添加更多快捷键

![](/markdown/pictures/06.png)

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

![](/markdown/pictures/08.png)

保存并退出

## 直接编辑源文件
官方的方法比较麻烦，这里推荐一个更简单的方法，和``linux``一样直接去编辑源文件
```sh
vi  $PREFIX/etc/apt/sources.list
```

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
一个计算圆周率``π``的小代码，用``4``个核心来计算``π``小数点后一万位，通过比较时间长短来比较性能
```sh
pkg install bc
time echo "scale = 10000;4 * a(1)" | bc -l
```
![](/markdown/pictures/17.png)

## hexo-anatole
这只是一个主题配置文件的备份，防止我自己忘记
### _config.yml
```yml
title: Hexo Book
subtitle:
description: hello world
keywords:
author: NibaZShab
language: eng
timezone:
avatar: /images/head.png

url: http://nibazshab.github.io
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:

source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
skip_render:

new_post_name: :title.md
default_layout: post
titlecase: false
external_link: true
filename_case: 0
render_drafts: false
post_asset_folder: false
relative_link: false
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: false
  tab_replace:

index_generator:
  path: ''
  per_page: 6
  order_by: -date

default_category: uncategorized
category_map:
tag_map:

date_format: YYYY-MM-DD
time_format: HH:mm:ss

per_page: 6
pagination_dir: page

theme: anatole

deploy:
  type: git
  repo: git@github.com:NibaZShab/NibaZShab.github.io.git
  branch: master

archive_generator:
  per_page: 0  
  yearly: false
  monthly: false
  daily: false
```
### 上传配置
```bash
# 准备上传 :
#!/bin/bash

# 文章整理
echo  "---
title: Huge The Book
date: 2090-01-27 12:07:12
---
" >> /sdcard/$/a.md
cat /sdcard/$/a.md /sdcard/$/1/404/README.md > /sdcard/$/1/markdown/pages/Huge-The-Book.md
rm /sdcard/$/a.md
rm $HOME/blog/source/_posts/*
cp /sdcard/$/1/markdown/pages/* $HOME/blog/source/_posts

hexo clean   # 清理无用文件

hexo g   # 生成静态博客
cp $HOME/blog/public/2090/01/27/Huge-The-Book/* /sdcard/$/1/2090/01/27/Huge-The-Book/
cd $HOME/blog/public/
cp -rf  archives css fonts images js /sdcard/$/1/
cp $HOME/blog/public/index.html /sdcard/$/1/
cd $HOME
rm -rf $HOME/blog/public/2*

# 完成提示
echo "
请修改 Huge-The-Book 文件最后一行
修改结束后输入 hexod 上传"

# hexod :
#!/bin/bash
cp -rf /sdcard/$/1/* $HOME/blog/public/
hexo d
```

---
# 完
注：转载于[Termux 高级终端安装使用配置教程](https://www.sqlsec.com/2018/05/termux.html)
