#!/bin/bash
clear
function logo(){
echo -e "




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
function main(){
echo -e "

1) 安装命令行版百度云
2) 修复底部小键盘
3) 切换清华源
4) 安装linux发行版
5) 安装hexo博客
6) 刷流量
7) 好van的东西
0) 退出
--------------------------------------------------
"
read -p "＄你选择的序号是：" xuan
case $xuan in
1)
	pkg install unzip -y
	pkg install vim -y
	pkg install wget -y
	mkdir 百度云
	cd 百度云
	wget https://github.com/NibaZShab/NibaZShab.github.io/releases/download/07/07.zip
	unzip 07.zip
	rm 07.zip
	chmod 777 启动
	echo "进度 [100%]"
	main
	;;
2)
	mkdir .termux
	echo "extra-keys = [['>','-',',','\"','.','/','*'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" >> $HOME/.termux/termux.properties
	echo "进度 [100%]\n请重启 termux"
	main
	;;
3)
	sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
	apt update && apt upgrade
	echo "进度 [100%]\n请重启 termux"
	main
	;;
4)
	echo "deb [trusted=yes] https://yadominjinta.github.io/files/ termux    extras" >> $PREFIX/etc/apt/sources.list
	pkg in atilo-cn
	echo "进度 [100%]"
	main
	;;
5)
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
	echo "进度 [100%]\n读取ssh密钥 cat ~/.ssh/id_rsa.pub\n检测ssh连接 ssh -T git@github.com"
	main
	;;
6)
	i=0
	while [ $((i++)) -le 999 ]
	do
	wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk 
	done
	main
	;;
7)
	van
	;;
0)
	exit
	;;
*)
	echo "＄你正确输入了一个错误序号！"
	main
esac
}
function van(){
clear
logo
echo -e "


11) 跑火车游戏
12) 彩虹猫
10) 返回
----------------------------------------
"
read -p "＄你选择的序号是：" vang
case $vang in
11)
	apt install sl -y
	echo "输入 sl 开始"
	van
	;;
12)
	pkg in nyancat -y
	echo "输入 nyancat 开始"
	van
	;;
10)
	claer
	logo
	main
	;;
*)
	echo "＄你正确输入了一个错误序号！"
	van
	;;
esac
}
logo
main
