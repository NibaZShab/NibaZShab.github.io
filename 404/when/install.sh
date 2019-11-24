#!/bin/sh
pkg in -y wget
wget -O $PREFIX/bin/when https://nibazshab.github.io/404/when/when.sh
chmod +x $PREFIX/bin/when
echo "输入 when 启动"
exit
