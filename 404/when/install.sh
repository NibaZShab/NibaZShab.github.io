#!/bin/sh
pkg install -y wget
wget -O $PREFIX/bin/when https://nibazshab.github.io/404/when/when.sh
chmod 777 $PREFIX/bin/when
echo "输入 when 启动"
exit
