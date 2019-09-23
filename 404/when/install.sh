#!/bin/bash
wget https://github.com/NibaZShab/NibaZShab.github.io/raw/master/404/when/when.sh
mv when.sh when
mv when $PREFIX/bin
chmod 777 $PREFIX/bin/when
rm -rf install.sh
echo -e "进度 [100%]\n输入 when 即可启动本程序"
