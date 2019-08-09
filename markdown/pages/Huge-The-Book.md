---
title: Huge The Book
date: 2090-01-27 12:07:12
---

# 404 NOT FOUND
---

此文之质，乃``MarkDown``之文。近日，忽觉余之尚缺一博客乎，是故，题此文也。是以集书签之素雅，动漫之风趣，亦有天籁之音相伴。可悲，余长叹余之``HTML``功力尚浅，不足以登大雅之堂，若论``CSS``及``JavaScript``，余则实属无奈。至于此，不得已题此``MarkDown``。若有来者，愿助余之题``HTML``之文，余自当感激不尽，不胜言谢

## Huge The Book
> **bookstars**  
  - **[我的图与时钟](https://nibazshab.github.io/404/time.html)**
  - **[我的hexo博客](https://nibazshab.github.io)**
  - **[我的旧破烂站](https://github.com/NibaZShab/NibaZShab.github.io/releases)**
  - **[刘宇哲的小站](https://sssssystem.github.io)**
    + ---
  - **养老院**
    + **[github](https://github.com/)**
    + **[百度云](https://pan.baidu.com/)**
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
• apk内部资源路径
$ /android_asset/
```
```sh
• 挂载目录为可读写
$ mount -o remount -rw  /
```
```sh
• 加或解锁文件abc
$ chattr -或+R +i abc
```
```sh
• 合并文件a和b为文件c
$ cat a b > c
```
```sh
• 清空abc内容但不删除abc
$ : > abc
```
```sh
• 查找文件abc并删除
$ find / -name "abc" |xargs rm -rf
```

### vim
```sh
• 把每一行的abc替换成cba
$ :1,$s/abc/cba/g
```
```sh
• 把包含abc的行全部删除
$ :g/abc/d
```
```sh
• 在每一行行首添加abc
$ :%s/^/abc/
```
```sh
• 在每一行行尾添加abc
$ :%s/$/abc/
```
```sh
• 取消自动折行
$ :set nowrap
```
```sh
• 显示行号
$ :set nu
```
```sh
• 删除光标所在行
$ dd
```

### bps-go.sh
```bash
#!/bin/bash
apt update && apt upgrade -y
apt install zip wget -y
termux-setup-storage
action1()
{
   wget -O 1.zip https://github.com/iikira/BaiduPCS-Go/releases/download/v3.3.3/BaiduPCS-Go-v3.3.3-android-21-arm64.zip
   unzip 1.zip && rm 1.zip
   mv BaiduPCS-Go-v3.3.3-android-21-arm64 BaiduPCS-Go
   echo "cd ~/BaiduPCS-Go && ./BaiduPCS-Go" >> $PREFIX/bin/bdy
   chmod 777 $PREFIX/bin/bdy
}
action2()
{
   wget -O 1.zip https://github.com/iikira/BaiduPCS-Go/releases/download/v3.5.6/BaiduPCS-Go-v3.5.6-android-21-arm64.zip
   unzip 1.zip && rm 1.zip
   mv BaiduPCS-Go-v3.5.6-android-21-arm64 BaiduPCS-Go
   echo "cd ~/BaiduPCS-Go && ./BaiduPCS-Go" >> $PREFIX/bin/bdy
   chmod 777 $PREFIX/bin/bdy
}
read -p " 
1 --- v3.3.3          2 --- v3.5.6
YOUR CHOOSE IS [1/2] " choose
if [ $choose = "1" ]
then
    action1
fi
if [ $choose = "2" ]
then
    action2
fi
echo -e "\n\n\n\n\n   输入bdy开始食用\n配置如下：\n\n    config set -appid=310646 \n\n    cd /apps/baidu_shurufa \n\n    config set -appid=265486 \n\n    config set -savedir /sdcard/Android \n\n"
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
