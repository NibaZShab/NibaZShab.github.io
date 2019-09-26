#!/bin/bash
termux-setup-storage
rm -rf storage
wget -O $PREFIX/bin/when https://github.com/NibaZShab/NibaZShab.github.io/raw/master/404/when/when.sh
chmod 777 $PREFIX/bin/when
rm -rf install.sh
echo -e "进度 [100%]\n输入 when 启动本程序"
exit
