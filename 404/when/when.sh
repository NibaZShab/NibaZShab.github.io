#!/bin/bash
cd ~
clear
function logo(){
echo -e "
\n\n\n\n\n\n
            h
             h
             h
         w   h        ee      n
  w   w   w  h h h   e   e    n n n
 w w w w w   h   h  e eee   n n   n
    w   w    h   h   e        n   n  
    w        h   hh    eee    n   n  n
             h                     n
             h
"
}
function go(){
echo -e "
\n
01)  安装命令行版百度云
02)  修复底部小键盘
03)  切换清华源
04)  安装linux发行版
05)  安装hexo博客(作者的仓库)
06)  刷流量/测网速
07)  好van的东西
08)  配置java关键
09)  安装aria2下载工具
00)  退出
---------------------------------------------
"
read -p "[when]＃你选择的序号是：" xuanze
case $xuanze in
01)
	pkg install unzip -y
	pkg install vim -y
	pkg install wget -y
	mkdir 百度云
	cd 百度云
	wget https://github.com/NibaZShab/NibaZShab.github.io/releases/download/07/07.zip
	unzip 07.zip
	rm 07.zip
	chmod 777 启动
	echo -e "进度 [100%]"
	go
	;;
02)
	mkdir .termux
	echo -e "extra-keys = [['>','-',',','\"','.','/','*'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" >> $HOME/.termux/termux.properties
	echo -e "进度 [100%]\n请重启 termux"
	go
	;;
03)
	sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
	apt update && apt upgrade
	echo -e "进度 [100%]\n请重启 termux"
	go
	;;
04)
	echo -e "deb [trusted=yes] https://yadominjinta.github.io/files/ termux    extras" >> $PREFIX/etc/apt/sources.list
	pkg in atilo-cn
	echo -e "进度 [100%]"
	go
	;;
05)
	pkg install unzip -y
	pkg install wget -y
	pkg install vim -y
	pkg install git -y
	pkg install nodejs-lts -y
	pkg install openssh -y
	mkdir 博客
	cd 博客
	wget https://github.com/NibaZShab/NibaZShab.github.io/releases/download/02/02.zip
	unzip 02.zip
	rm 02.zip
	npm install hexo-cli -g
	npm install hexo --save
	mkdir 404
	cd 404
	hexo init
	rm _config.yml
	mv ../_config.yml .
	mv ../up.sh .
	chmod 777 up.sh
	cd themes
	mv ../../inside .
	cd ..
	git config --global user.name "NibaZShab"
	git config --global user.email "nibazshab@gmail.com"
	git init
	git remote add origin git@github.com:NibaZShab/NibaZShab.github.io.git
	ssh-keygen -t rsa -C "nibazshab@gmail.com"
	cd ..
	git clone https://github.com/NibaZShab/NibaZShab.github.io.git
	cd /sdcard
	mkdir $
	cd ~
	ln -s /sdcard/$ 404
	cd 博客/NibaZShab.github.io
	mv 404 ~/404/$
	cd ..
	rm -rf NibaZShab.github.io
	cd 404/source
	mkdir about
	mkdir links
	cd _posts
	rm *
	cp ~/404/$/markdown/page/* .
	cd ../about
	cp ~/404/$/markdown/about.md ./index.md
	cd ../links
	cp ~/404/$/markdown/links.md ./index.md
	cd ../..
	cp ~/404/$/markdown/book.md .
	chmod 777 book.md
	npm install hexo-deployer-git --save
	echo -e "进度 [100%]\n读取ssh密钥 cat ~/.ssh/id_rsa.pub\n检测ssh连接 ssh -T git@github.com\n\n注:此为作者的个人仓库，请重新创建ssh密钥，连接自己的github"
	go
	;;
06)
	i=0
	while [ $((i++)) -le 999 ]
	do
	wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk 
	done
	go
	;;
07)
	clear
	logo
	back
	;;
08)
	pkg install git -y
	pkg install wget -y
	git clone https://gitlab.com/st42/termux-sudo.git
	cd termux-sudo
	pkg install ncurses-utils
	apt install wget [se non lo hai]
	cat sudo > /data/data/com.termux/files/usr/bin/sudo
	chmod 777 /data/data/com.termux/files/usr/bin/sudo
	git clone https://github.com/Hax4us/java.git
	cd java
	chmod 777 installjava
	./installjava
	rm -rf termux-sudo
	echo -e "进度 [100%]"
	go
	;;
09)
	pkg install aria2 -y
	echo -e "am start -a android.intent.action.VIEW -d http://aria2.net\naria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c" >> 启动aria2
	chmod 777 启动aria2
	echo -e "进度 [100%]"
	go
	;;
00)
	exit
	;;
*)
	clear
	logo
	echo -e "\n\n\n＃你正确输入了一个错误序号！"
	go
esac
}
function back(){
echo -e "
\n
001)  跑火车游戏
002)  彩虹猫
000)  返回
---------------------------------------------
"
read -p "[when]＃你选择的序号是：" haixuanze
case $haixuanze in
001)
	pkg install sl -y
	echo -e "输入 sl 开始"
	back
	;;
002)
	pkg in nyancat -y
	echo -e "输入 nyancat 开始"
	back
	;;
000)
	clear
	logo
	go
	;;
*)
	clear
	logo
	echo -e "\n\n\n＃你正确输入了一个错误序号！"
	back
	;;
esac
}
logo
go
