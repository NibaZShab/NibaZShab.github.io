#!/bin/bash
# Copyright (c) 2019 NibaZShab
# https://github.com/NibaZShab/NibaZShab.github.io
# https://nibazshab.github.io
# sh -c "$(curl -fsSL https://nibazshab.github.io/404/when/install.sh)"
# apt update && apt upgrade
clear
colorlogo="\033[31m"
colorhint="\033[36;43;1m"
colorend="\033[0m"
function logo(){
echo -e "$colorlogo"
echo -e "\n\n\n\n\n\n"
sleep 0.025s
echo -e "               +"
sleep 0.025s
echo -e "               +"
sleep 0.025s
echo -e "               +"
sleep 0.025s
echo -e "               +"
sleep 0.025s
echo -e "  +   +   +    +++++++    +++++++    +++++++"
sleep 0.025s
echo -e "  +   +   +    +     +    +     +    +     +"
sleep 0.025s
echo -e "  +   +   +    +     +    +++++++    +     +"
sleep 0.025s
echo -e "  +   +   +    +     +    +          +     +"
sleep 0.025s
echo -e "  +++++++++    +     +    +++++++    +     +"
echo -e " $colorend"
}
function island(){ home0 ; home1 ; }
function home0(){
cd $HOME
echo -e "\n\n"
echo -e "01)  好van的东西"
sleep 0.025s
echo -e "02)  修复底部小键盘"
sleep 0.025s
echo -e "03)  切换清华源(暂不可用)"
sleep 0.025s
echo -e "04)  使用atilo安装linux发行版"
sleep 0.025s
echo -e "05)  安装hexo博客(作者的库)"
sleep 0.025s
echo -e "06)  切换termux问候语"
sleep 0.025s
echo -e "07)  安装命令行版百度云"
sleep 0.025s
echo -e "08)  安装aria2或axel或annie下载工具"
sleep 0.025s
echo -e "09)  美化终端(zsh)"
sleep 0.025s
echo -e "10)  配置各种编程语言环境"
sleep 0.025s
echo -e "11)  网址转二维码"
sleep 0.025s
echo -e "99)  充值成为svip用户"
sleep 0.025s
echo -e "00)  退出"
sleep 0.025s
echo -e "---------------------------------------------"
sleep 0.025s
echo -e ""
}
function home1(){
read -p "[when]# 你选择的序号是：" home
case $home in
01)
	echo -e "\n\n\n\n\n"
	logo
	sleep 0.025s
	game0 ; game1
	;;
02)
	sleep 0.5s
	if test -d $HOME/.termux/
	then
		:
	else
		mkdir -p $HOME/.termux/
	fi
	echo -e "extra-keys = [['TAB','>','-','~','/','*','$'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" > $HOME/.termux/termux.properties
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 请重启 termux $colorend"
	home0 ; home1
	;;
03)
#	sleep 0.5s
#	sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
#	echo -e "$colorhint 如果卡进度条，则退出重开termux，并运行 dpkg --configure -a 修复 $colorend"
#	sleep 3s
#	apt update && apt upgrade -y
#	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 请重启 termux $colorend"
	echo -e "都说了清华源暂不可用了......."
	sleep 3s
	home0 ; home1
	;;
04)
	sleep 0.5s
	echo -e "deb [trusted=yes] https://yadominjinta.github.io/files/ termux    extras" >> $PREFIX/etc/apt/sources.list
	apt update && apt upgrade -y
	apt-get install -y atilo-cn
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入 atilo 查看使用方法 $colorend"
	home0 ; home1
	;;
05)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y unzip
	apt-get install -y git
	apt-get install -y nodejs-lts
	apt-get install -y openssh
	apt-get install -y wget
	rm -rf $HOME/博客/
	mkdir -p $HOME/博客/
	wget -O $HOME/博客/02.zip https://github.com/NibaZShab/NibaZShab.github.io/releases/download/02/02.zip
	cd $HOME/博客/
	unzip $HOME/博客/02.zip
	rm -rf $HOME/博客/02.zip
	npm install -g hexo-cli
	npm install --save hexo
	mkdir -p $HOME/博客/404/
	cd $HOME/博客/404/
	hexo init
	rm -rf $HOME/博客/404/_config.yml
	mv -f $HOME/博客/_config.yml $HOME/博客/404/
	mv -f $HOME/博客/up.sh $HOME/博客/404/
	chmod 777 $HOME/博客/404/up.sh
	mv -f $HOME/博客/inside $HOME/博客/404/themes/
	cd $HOME/博客/404/
	git config --global user.name "NibaZShab"
	git config --global user.email "nibazshab@gmail.com"
	git init
	git remote add origin git@github.com:NibaZShab/NibaZShab.github.io.git
	echo -e "\n $colorhint 接下来请一路回车即可 $colorend"
	sleep 2s
	ssh-keygen -t rsa -C "nibazshab@gmail.com"
	cd $HOME/博客/
	git clone https://github.com/NibaZShab/NibaZShab.github.io.git
	if test -d /sdcard/$/
	then
		:
	else
		mkdir -p /sdcard/$/
	fi
	cd $HOME
	ln -s /sdcard/$/ $HOME/404/
	cd $HOME/博客/NibaZShab.github.io/
	mv -f $HOME/博客/NibaZShab.github.io/404/ $HOME/404/$/
	rm -rf $HOME/博客/NibaZShab.github.io/
	mkdir -p $HOME/博客/404/source/about/
	mkdir -p $HOME/博客/404/source/links/
	rm -rf $HOME/博客/404/source/_posts/*
	cp -rf $HOME/404/$/markdown/page/* $HOME/博客/404/source/_posts/
	cp -rf $HOME/404/$/markdown/about.md $HOME/博客/404/source/about/index.md
	cp -rf $HOME/404/$/markdown/links.md $HOME/博客/404/source/links/index.md
	cp -rf $HOME/404/$/markdown/book.md $HOME/博客/404/
	chmod 777 $HOME/博客/404/book.md
	npm install --save hexo-deployer-git
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 读取ssh密钥请输入 cat $HOME/.ssh/id_rsa.pub $colorend \n $colorhint 检测ssh连接状况请输入 ssh -T git@github.com $colorend \n\n $colorhint 注: 此为作者个人的博客，部分文件和操作逻辑较为难以理解 $colorend \n $colorhint 建议前往 https://nibazshab.github.io/post/04 $colorend \n $colorhint 可按照小白教程搭建自己的博客 $colorend"
	home0 ; home1
	;;
06)
	sleep 0.5s
	echo -e "\n\n\n\n                   Welcome to Termux!\n\n           I'm NibaZShab,thanks for use \"when\"\n\n\n\n                      代码使人头冷\n                    专业护发，用飘柔\n\n  ----------------------------------------------------\n             民生各有所乐兮，余独好修以为常\n             虽体解吾犹未变兮，岂余心之可惩\n  ----------------------------------------------------\n\n                    Hello  my  World\n\n\n" > $PREFIX/etc/motd
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 请重启 termux $colorend \n $colorhint 如显示出问题，请双指捏合屏幕调整终端大小 $colorend"
	home0 ; home1
	;;
07)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y golang
	apt-get install -y git
	cd $HOME
	git clone https://github.com/iikira/BaiduPCS-Go.git
	cd $HOME/BaiduPCS-Go/
	echo -e "$colorhint 编译时间较长，请耐心等待 $colorend"
	sleep 2s
	GOOS=android GOARCH=arm64 go build -o bdy main.go
	mv -f bdy $HOME
	cd $HOME
	rm -rf $HOME/BaiduPCS-Go/
	chmod -Rf 777 $HOME/go/
	rm -rf $HOME/go/
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 编译指令感谢 coolapk@萌系生物研究员 提供 $colorend \n $colorhint 输入 ~/bdy 开始 $colorend"
	home0 ; home1
	;;
08)
	sleep 0.5s
	echo -e "\naria2 -> 1    axel -> 2    annie -> 3\n"
	read -p "[when]# 你选择的序号是：" a
	case $a in
	1)
		sleep 0.5s
		apt update && apt upgrade -y
		apt-get install -y aria2
		apt-get install -y wget
		if test -d /sdcard/Download/aria2/
		then
			if test -e /sdcard/Download/aria2/aria2.session
			then
				:
			else
				touch /sdcard/Download/aria2/aria2.session
			fi
		else
			mkdir -p /sdcard/Download/aria2/
			touch /sdcard/Download/aria2/aria2.session
		fi
		if test -d $HOME/.config/
		then
			rm -rf $HOME/.config/aria2/
		else
			:
		fi
		mkdir -p $HOME/.config/aria2/
		wget -O $HOME/.config/aira2/aria2.conf https://github.com/NibaZShab/NibaZShab.github.io/releases/download/09/09.conf
		echo -e "echo \"rpc-key: 123456\"\nsleep 2s\nam start -a android.intent.action.VIEW -d http://aria2.net\naria2c --conf-path=$HOME/.config/aria2/aria2.conf\"" > $HOME/aria2
		chmod 777 $HOME/aria2
		echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入~/aria2 开始 $colorend"
		home0 ; home1
		;;
	2)
		sleep 0.5s
		apt update && apt upgrade -y
		apt-get install -y axel
		echo -e "echo \"下载百度云方法：前往 https://www.baidusu.com 获取下载链接，然后输入 axel -n 256 -o /sdcard/Download/文件名 下载链接\"" > $HOME/axelh
		chmod 777 $HOME/axelh
		echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入 ~/axelh 查看下载百度云教程 $colorend"
		home0 ; home1
		;;
	3)
		sleep 0.5s
		apt update && apt upgrade -y
		apt-get install -y golang
		apt-get install -y git
		cd $HOME
		git clone https://github.com/iawia002/annie.git
		cd $HOME/annie/
		echo -e "$colorhint 编译时间较长，请耐心等待 $colorend"
		sleep 2s
		GOOS=android GOARCH=arm64 go build -o annie main.go
		mv -f annie $PREFIX/bin/
		cd $HOME
		rm -rf $HOME/annie
		chmod -Rf 777 $HOME/go/
		rm -rf $HOME/go/
		echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 编译指令感谢 coolapk@萌系生物研究员 提供 $colorend \n $colorhint 使用annie的教程请自行百度 $colorend"
		home0 ; home1
		;;
	*)
		echo -e "[when]# 你正确输入了一个错误序号！"
		sleep 1s
		home0 ; home1
		;;
	esac
	;;
09)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y wget
	rm -rf $HOME/install.sh
	wget https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh
	echo -e "\n $colorhint 推荐配色值 → 19 19 $colorend \n"
	sleep 3s
	sh $HOME/install.sh
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 请重启 termux $colorend"
	rm -rf $HOME/storage/
	home0 ; home1
	;;
10)
	echo -e "\n\n\n\n\n"
	logo
	sleep 0.025s
	work0 ; work1
	;;
11)
	sleep 0.5s
	if test -e $PREFIX/bin/curl
	then
		:
	else
		apt update && apt upgrade -y
		apt-get install -y curl
		echo -e "必要程序已添加"
	fi
	read -p "请输入要转换的网址：" b
	echo -e "转换中......"
	sleep 0.7s
	echo -e "该网址的二维码如下："
	echo "$b" |curl -F-=\<- qrenco.de
	sleep 4s
	home0 ; home1
	;;
99)
	read -p "[when]# 请输入充值的软妹币额度：" c
	case $c in
	[0-9]*)
		read -p "[when]# 请输入支付密码："
		echo -e "[when]# 连接服务器中..."
		sleep 1s
		echo -e "[when]# 恭喜！已成功充入 $c 软妹币！"
		sleep 0.2s
		echo -e "[when]# 已升级为 svip 版！"
		;;
	*)
		sleep 1s
		echo -e "[when]# 服务器请求错误！"
		sleep 0.2s
		echo -e "[when]# 发起入侵..."
		sleep 0.2s
		echo -e "[when]# 入侵成功！你的软妹币我全都拿走啦！"
		;;
	esac
	;;
00)
	clear
	cat $PREFIX/etc/motd
	exit
	;;
exit)
	clear
	cat $PREFIX/etc/motd
	exit
	;;
*)
	echo -e "[when]# 你正确输入了一个错误序号！"
	sleep 1s
	home1
	;;
esac
}
function game0(){
cd $HOME
echo -e "\n\n"
echo -e "01)  小火车"
sleep 0.025s
echo -e "02)  彩虹猫"
sleep 0.025s
echo -e "03)  screenfetch"
sleep 0.025s
echo -e "04)  neofetch"
sleep 0.025s
echo -e "05)  奶牛说话"
sleep 0.025s
echo -e "06)  打开王者荣耀"
sleep 0.025s
echo -e "07)  刷流量"
sleep 0.025s
echo -e "08)  欧皇测试游戏"
sleep 0.025s
echo -e "09)  贪吃蛇"
sleep 0.025s
echo -e "10)  终端纯文本浏览器"
sleep 0.025s
echo -e "11)  音乐播放器"
sleep 0.025s
echo -e "00)  返回"
sleep 0.025s
echo -e "---------------------------------------------"
sleep 0.025s
echo -e ""
}
function game1(){
read -p "[when]# 你选择的序号是：" game
case $game in
01)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y sl
	echo -e "$colorhint 进度[100%] $colorend \n $colorhint 输入 sl 开始 $colorend"
	game0 ; game1
	;;
02)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y nyancat
	echo -e "$colorhint 进度[100%] $colorend \n $colorhint 输入 nyancat 开始 $colorend"
	game0 ; game1
	;;
03)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y screenfetch
	echo -e "$colorhint 进度[100%] $colorend \n $colorhint 输入 screenfetch 开始 $colorend"
	game0 ; game1
	;;
04)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y neofetch
	echo -e "$colorhint 进度[100%] $colorend \n $colorhint 输入 neofetch 开始 $colorend"
	game0 ; game1
	;;
05)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y cowsay
	echo -e "$colorhint 进度[100%] $colorend \n $colorhint 输入 cowsay 要说的话 开始 $colorend"
	game0 ; game1
	;;
06)
	sleep 0.5s
	am start -n com.tencent.tmgp.game0/com.tencent.tmgp.game0.game0Activity
	exit
	;;
07)
	sleep 0.5s
	if test -e $PREFIX/bin/wget
	then
		:
	else
		apt update && apt upgrade -y
		apt-get install -y wget
	fi
	i=0
	while [ $((i++)) -le 999 ]
	do
		wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk
	done
	;;
08)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y wget
	wget -O $HOME/van https://nibazshab.github.io/404/when/van.sh
	chmod 777 $HOME/van
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入 ~/van 开始 $colorend"
	game0 ; game1
	;;
09)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y nsnake
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入 nsnake 开始 $colorend \n $colorhint 如无法运行，请双指捏合屏幕调整终端大小 $colorend"
	game0 ; game1
	;;
10)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y w3m
	apt-get install -y elinks
	apt-get install -y lynx
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 三个浏览器分别为 w3m, elinks, lynx  使用方法请自行百度 $colorend"
	game0 ; game1
	;;
11)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y mpv
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 使用方法：mpv 音乐链接"
	game0 ; game1
	;;
00)
	echo -e "\n\n\n\n\n"
	logo
	sleep 0.025s
	home0 ; home1
	;;
exit)
	clear
	cat $PREFIX/etc/motd
	exit
	;;
*)
	echo -e "[when]# 你正确输入了一个错误序号！"
	sleep 1s
	game1
	;;
esac
}
function work0(){
cd $HOME
echo -e "\n\n"
echo -e "01)  python"
sleep 0.025s
echo -e "02)  java"
sleep 0.025s
echo -e "03)  go"
sleep 0.025s
echo -e "04)  c/c++"
sleep 0.025s
echo -e "05)  php"
sleep 0.025s
echo -e "00)  返回"
sleep 0.025s
echo -e "---------------------------------------------"
sleep 0.025s
echo -e ""
}
function work1(){
read -p "[when]# 你选择的序号是：" work
case $work in
01)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y python
	echo -e "$colorhint 进度 [100%] $colorend \n $colorhint 输入 python 进入python环境 $colorend"
	work0 ; work1
	;;
02)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y wget
	wget -O $HOME/jdk.deb https://github.com/NibaZShab/NibaZShab.github.io/releases/download/08/08.deb
	dpkg -i $HOME/jdk.deb
	rm -rf $HOME/jdk.deb
	echo -e "$colorhint 进度 [100%] $colorend"
	work0 ; work1
	;;
03)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y golang
	echo -e "$colorhint 进度 [100%] $colorend"
	work0 ; work1
	;;
04)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y clang
	echo -e "$colorhint 进度 [100%] $colorend"
	work0 ; work1
	;;
05)
	sleep 0.5s
	apt update && apt upgrade -y
	apt-get install -y php
	echo -e "$colorhint 进度 [100%] $colorend"
	work0 ; work1
	;;
00)
	echo -e "\n\n\n\n\n"
	logo
	sleep 0.025s
	home0 ; home1
	;;
exit)
	clear
	cat $PREFIX/etc/motd
	exit
	;;
*)
	echo -e "[when]# 你正确输入了一个错误序号！"
	sleep 1s
	work1
	;;
esac
}
logo
sleep 0.025s
island
exit
