#!/bin/bash
# Copyright (c) 2019 NibaZShab
# https://github.com/NibaZShab/NibaZShab.github.io
# https://nibazshab.github.io
# sh -c "$(curl -fsSL https://nibazshab.github.io/404/when/install.sh)"
clear
function logo(){
echo -e "\033[31m
\n\n\n\n\n\n
                +
		+
		+
   +   +   +    +++++++    +++++++    +++++++
   +   +   +    +     +    +     +    +     +
   +   +   +    +     +    +++++++    +     +
   +   +   +    +     +    +          +     +
   +++++++++    +     +    +++++++    +     +
\033[0m"
}
function home(){
cd $HOME
echo -e "
\n
01)  好van的东西
02)  修复底部小键盘
03)  切换清华源
04)  使用atilo安装linux发行版
05)  安装hexo博客(作者的库)
06)  刷流量/测网速
07)  安装命令行版百度云
08)  安装aria2下载工具
09)  切换为zsh终端
10)  配置python或java环境
11)  网址转二维码
00)  退出
---------------------------------------------
"
read -p "[when]# 你选择的序号是：" jia
case $jia in
01)
	clear
	logo
	sleep 1s
	game
	;;
02)
	sleep 0.5s
	if test -e $HOME/.termux
	then
		:
	else
		mkdir -p $HOME/.termux
	fi
	echo -e "extra-keys = [['>','-',',','\"','.','/','*'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" > $HOME/.termux/termux.properties
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m请重启 termux\033[0m"
	home
	;;
03)
	sleep 0.5s
	sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
	echo -e "\033[36;43;1m如果卡进度条，则退出重开termux，并运行 dpkg --configure -a 修复\033[0m"
	sleep 3s
	apt update && apt upgrade
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m请重启 termux\033[0m"
	home
	;;
04)
	sleep 0.5s
	echo -e "deb [trusted=yes] https://yadominjinta.github.io/files/ termux    extras" >> $PREFIX/etc/apt/sources.list
	pkg in atilo-cn
	echo -e "\033[36;43;1m进度 [100%]\033[0m"
	home
	;;
05)
	sleep 0.5s
	pkg install -y unzip
	pkg install -y git
	pkg install -y nodejs-lts
	pkg install -y openssh
	pkg install -y wget
	rm -rf $HOME/博客
	mkdir -p $HOME/博客	
	wget -O $HOME/博客/02.zip https://github.com/NibaZShab/NibaZShab.github.io/releases/download/02/02.zip
	cd $HOME/博客
	unzip $HOME/博客/02.zip
	rm -rf $HOME/博客/02.zip
	npm install -g hexo-cli
	npm install --save hexo
	mkdir -p $HOME/博客/404
	cd $HOME/博客/404
	hexo init
	rm -rf $HOME/博客/404/_config.yml
	mv -f $HOME/博客/_config.yml $HOME/博客/404
	mv -f $HOME/博客/up.sh $HOME/博客/404
	chmod 777 $HOME/博客/404/up.sh
	mv -f $HOME/博客/inside $HOME/博客/404/themes
	cd $HOME/博客/404
	git config --global user.name "NibaZShab"
	git config --global user.email "nibazshab@gmail.com"
	git init
	git remote add origin git@github.com:NibaZShab/NibaZShab.github.io.git
	echo -e "\n\033[36;43;1m接下来请一路回车即可\033[0m"
	sleep 2s
	ssh-keygen -t rsa -C "nibazshab@gmail.com"
	cd $HOME/博客
	git clone https://github.com/NibaZShab/NibaZShab.github.io.git
	if test -e /sdcard/$
	then
		:
	else
		mkdir -p /sdcard/$
	fi
	cd $HOME
	ln -s /sdcard/$ $HOME/404
	cd $HOME/博客/NibaZShab.github.io
	mv -f $HOME/博客/NibaZShab.github.io/404 $HOME/404/$
	rm -rf $HOME/博客/NibaZShab.github.io
	mkdir -p $HOME/博客/404/source/about
	mkdir -p $HOME/博客/404/source/links
	rm -rf $HOME/博客/404/source/_posts/*
	cp $HOME/404/$/markdown/page/* $HOME/博客/404/source/_posts
	cp $HOME/404/$/markdown/about.md $HOME/博客/404/source/about/index.md
	cp $HOME/404/$/markdown/links.md $HOME/博客/404/source/links/index.md
	cp $HOME/404/$/markdown/book.md $HOME/博客/404
	chmod 777 $HOME/博客/404/book.md
	npm install --save hexo-deployer-git
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m读取ssh密钥请输入 cat $HOME/.ssh/id_rsa.pub\033[0m\n\033[36;43;1m检测ssh连接状况请输入 ssh -T git@github.com\033[0m\n\n\033[36;43;1m注: 此为作者个人的博客，部分文件和操作逻辑较为难以理解\033[0m\n\033[36;43;1m建议前往 https://nibazshab.github.io/post/04\033[0m\n\033[36;43;1m可按照小白教程搭建自己的博客\033[0m"
	home
	;;
06)
	sleep 0.5s
	if test -e $PREFIX/bin/wget
	then
		:
	else
		pkg install -y wget
	fi
	i=0
	while [ $((i++)) -le 999 ]
	do
	wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk
	done
	;;
07)
	sleep 0.5s
	pkg install -y golang
	pkg install -y git
	cd $HOME
	git clone https://github.com/iikira/BaiduPCS-Go.git
	cd $HOME/BaiduPCS-Go
	echo -e "\033[36;43;1m编译时间较长，请耐心等待\033[0m"
	sleep 2s
	GOOS=android GOARCH=arm64 go build -o bdy main.go
	mv -f bdy $HOME
	cd $HOME
	rm -rf $HOME/BaiduPCS-Go
	chmod -Rf 777 $HOME/go
	rm -rf $HOME/go
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m输入 ./bdy 开始\033[0m"
	home
	;;
08)
	sleep 0.5s
	pkg install -y aria2
	pkg install -y wget
	cd /sdcard/Download
	rm -rf /sdcard/Download/aria2
	mkdir -p /sdcard/Download/aria2
	touch /sdcard/Download/aria2/aria2.session
	cd $HOME
	wget -O $PREFIX/etc/aria2.conf https://github.com/NibaZShab/NibaZShab.github.io/releases/download/09/09.conf
	rm -rf $HOME/aria2
	echo -e "echo \"rpc-key: 123456\"\nsleep 2s\nam start -a android.intent.action.VIEW -d http://aria2.net\naria2c --conf-path=$PREFIX/etc/aria2.conf" >> $HOME/aria2
	chmod 777 $HOME/aria2
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m输入 ./aria2 开始\033[0m"
	home
	;;
09)
	sleep 0.5s
	pkg install -y wget
	rm -rf $HOME/install.sh
	wget https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh
	echo -e "\033[36;43;1m\n推荐配色值 → 19 19\033[0m\n"
	sleep 3s
	sh install.sh
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m请重启 termux\033[0m"
	rm -rf storage
	home
	;;
10)
	clear
	logo
	sleep 1s
	work
	;;
11)
	sleep 0.5s
	if test -e $PREFIX/bin/curl
	then
		:
	else
		pkg install -y curl
		echo -e "必要程序已添加"
	fi
	read -p "请输入要转换的网址：" wz
	echo -e "转换中......"
	sleep 0.7s
	echo -e "该网址的二维码如下："
	echo "$wz" |curl -F-=\<- qrenco.de
	sleep 4s
	home
	;;
00)
	clear
	cat $PREFIX/etc/motd
	exit
	;;
*)
	clear
	logo
	echo -e "\n\n\n[when]# 你正确输入了一个错误序号！"
	sleep 2s
	home
	;;
esac
}
function game(){
cd $HOME
echo -e "
\n
01)  小火车
02)  彩虹猫
03)  screenfetch
04)  neofetch
05)  奶牛说话
06)  打开王者荣耀
00)  返回
---------------------------------------------
"
read -p "[when]# 你选择的序号是：" haovande
case $haovande in
01)
	sleep 0.5s
	pkg install -y sl
	echo -e "\033[36;43;1m进度[100%]\033[0m\n\033[36;43;1m输入 sl 开始\033[0m"
	game
	;;
02)
	sleep 0.5s
	pkg install -y nyancat
	echo -e "\033[36;43;1m进度[100%]\033[0m\n\033[36;43;1m输入 nyancat 开始\033[0m"
	game
	;;
03)
	sleep 0.5s
	pkg install -y screenfetch
	echo -e "\033[36;43;1m进度[100%]\033[0m\n\033[36;43;1m输入 screenfetch 开始\033[0m"
	game
	;;
04)
	sleep 0.5s
	pkg install -y neofetch
	echo -e "\033[36;43;1m进度[100%]\033[0m\n\033[36;43;1m输入 neofetch 开始\033[0m"
	game
	;;
05)
	sleep 0.5s
	pkg install -y cowsay
	echo -e "\033[36;43;1m进度[100%]\033[0m\n\033[36;43;1m输入 cowsay 要说的话 开始\033[0m"
	game
	;;
06)
	sleep 0.5s
	am start -n com.tencent.tmgp.sgame/com.tencent.tmgp.sgame.SGameActivity
	exit
	;;
00)
	clear
	logo
	sleep 1s
	home
	;;
*)
	clear
	logo
	echo -e "\n\n\n[when]# 你正确输入了一个错误序号！"
	sleep 2s
	game
	;;
esac
}
function work(){
cd $HOME
echo -e "
\n
01)  python
02)  java
03)  go
04)  c/c++
00)  返回
---------------------------------------------
"
read -p "[when]# 你选择的序号是：" huanjing
case $huanjing in
01)
	sleep 0.5s
	pkg install -y python
	echo -e "\033[36;43;1m进度 [100%]\033[0m\n\033[36;43;1m输入 python 进入python环境\033[0m"
	work
	;;
02)
	sleep 0.5s
	pkg install -y wget
	wget -O $HOME/jdk.deb https://github.com/NibaZShab/NibaZShab.github.io/releases/download/08/08.deb
	dpkg -i $HOME/jdk.deb
	rm -rf $HOME/jdk.deb
	echo -e "\033[36;43;1m进度 [100%]\033[0m"
	work
	;;
03)
	sleep 0.5s
	pkg install -y golang
	echo -e "\033[36;43;1m进度 [100%]\033[0m"
	work
	;;
04)
	sleep 0.5s
	pkg install -y clang
	echo -e "\033[36;43;1m进度 [100%]\033[0m"
	work
	;;
00)
	clear
	logo
	sleep 1s
	home
	;;
*)
	clear
	logo
	echo -e "\n\n\n[when]# 你正确输入了一个错误序号！"
	sleep 2s
	work
	;;
esac
}
logo
sleep 1s
home
