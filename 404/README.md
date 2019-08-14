# 404 NOT FOUND
---

## 二十四节气
春：  立春，雨水，惊蛰，春分，清明，谷雨  
夏：  立夏，小满，芒种，夏至，小暑，大暑  
秋：  立秋，处暑，白露，秋分，寒露，霜降  
冬：  立冬，小雪，大雪，冬至，小寒，大寒

## Huge The Book
> **bookstars**  
  - **[我的图与时钟](https://nibazshab.github.io/404/time.html)**
  - **[我的hexo博客](https://nibazshab.github.io)**
  - **[我的旧破烂站](https://github.com/NibaZShab/NibaZShab.github.io/releases)**
  - **[刘宇哲的小站](https://sssssystem.github.io)**
    + ---
  - **养老院**
    + **[聚合图床](https://www.superbed.cn/)**
    + **[奶牛传输](https://cowtransfer.com/)**
    + **[石墨文档](https://shimo.im/)**
  - **不可名状**
    + **[好萌动漫](https://nicemoe.at/)**
    + **[熊猫书签exhentai](https://expanda.org/)**
    + **[恋爱游戏网](https://www.lianaiyx.com/)**
    + **[gal资源站](https://www.nyagal.com/)**
    + **[忧郁的弟弟](https://www.mmgal.com/)**
    + **[loadbt](https://www.loadbt.com/files)**
    + **[bt搜索聚合](https://hao.su/909/)**
  - **邮箱**
    + **[企鹅邮箱](https://w.mail.qq.com)**
    + **[临时邮箱](https://10minutemail.net/m/?lang=zh-cn)**
  - **没什么用**
    + **[网页生成站](http://sc.ilysc.cn/)**
    + **[腾讯微Q关闭推送广告](https://privacy.qq.com/yszc-m.htm)**
    + **[web ua检测](http://service.spiritsoft.cn/ua.html)**
    + **[pixiv以图搜图](http://saucenao.com/)**
    + **[内网穿透](https://ngrok.com)**

## Lot Of Any

### termimal
```sh
截屏
screencap /sdcard/abc.png
```
```sh
空白符号
ㅤㅤㅤ
```
```sh
tar备份
tar -cvf /sdcard/abc.tar /        # 备份
tar -xvf /sdcard/abc.tar -C /     # 恢复
```
```sh
apk包内资源
/android_asset/
```
```sh
挂载为可读写
mount -o remount -rw /
```
```sh
锁定文件abc
chattr -R +i abc     # 加锁
chattr -R -i abc     # 解锁
```
```sh
合并a和b为c
cat a b > c
```
```sh
清空abc但不删除
: > abc
```
```sh
查找abc并删除
find / -name abc |xargs rm -rf
```

### vim
配置文件名为``vimrc``, 我传了一个不错的``vimrc``, 如需要，可点击下方传送门  
**[我是传送门](https://github.com/NibaZShab/NibaZShab.github.io/releases/tag/vim)**
```sh
开启十六进制模式
:%!xxd
```
```sh
关闭十六进制模式
:%!xxd -r
```
```sh
把每一行的abc替换成cba
:1,$s/abc/cba/g
```
```sh
把包含abc的行全部删除
:g/abc/d
```
```sh
在每一行行首添加abc
:%s/^/abc/
```
```sh
在每一行行尾添加abc
:%s/$/abc/
```
```sh
取消自动折行
:set nowrap
```
```sh
显示行号
:set nu
```
```sh
删除光标所在行
dd
```

### bps-go.sh
```bash
#!/bin/bash
echo "
****************************************************
*
*   BaiduPCS-Go
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
*   百度输入法接口的配置如下:
*
*     config set -appid=310646
*     cd /apps/baidu_shurufa
*     config set -appid=265486
*     config set -savedir /sdcard/Download
*
*   输入 bdy 即可食用
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

### anime
```
在下坂本，有何贵干
工作细胞
游戏人生
干物妹，小埋
Charlotte
小林家的龙女仆
埃罗芒阿老师
我的妹妹不可能这么可爱
珈百璃的堕落
邻家索菲
猫咪日常
狐妖小红娘
龙王的工作
请问你今天要来点兔子吗
贤惠幼妻狐小仙
jojo的奇妙冒险
天使降临到我身边
轻音少女
Alice or Alice
辉夜大小姐想让我告白
GJ部
平凡职业造就世界最强
```

### read
下面的是一个非常棒的电纸书阅读器的界面的颜色配置。

| 背景 | 文本 | 
| :---: | :---: | 
| ![](/markdown/pictures/01.png) | ![](/markdown/pictures/02.png) |

### music
![](/markdown/pictures/03.png)

---
# 完
