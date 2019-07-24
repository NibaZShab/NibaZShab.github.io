# 404 NOT FOUND

---
> **bookstar**  
  - **[我的时间站](https://nibazshab.github.io/time.html)**
  - **[我的资源库](https://github.com/NibaZShab/NibaZShab.github.io/releases)**
    + ---
  - **养老院**
    + **[聚合图床](https://www.superbed.cn/)**
    + **[github](https://github.com/)**
    + **[百度云](https://pan.baidu.com/)**
  - **不可名状**
    + **[好萌动漫](https://www.nicemoe.net/?aff=31664)**
    + **[熊猫书签exhentai](https://expanda.org/)**
    + **[恋爱游戏网](https://www.lianaiyx.com/)**
    + **[galgames发布地](https://www.nyagal.com/)**
    + **[loadbt](https://www.loadbt.com/files)**
  - **邮箱**
    + **[企鹅邮箱](https://w.mail.qq.com)**
    + **[临时邮箱](https://10minutemail.net/m/?lang=zh-cn)**
  - **音乐**
    + **[无损音乐](http://www.xiaoluo666.cn/musicPlayer/)**
    + **[无损音乐](https://m.sq688.com/)**
    + **[在线听音乐](http://www.cndkk.com/Music/)**
  - **没什么用**
    + **[网页自动生成](http://sc.ilysc.cn/)**
    + **[腾讯官方关闭微Q推送广告](https://privacy.qq.com/yszc-m.htm)**
    + **[web ua检测](http://service.spiritsoft.cn/ua.html)**
    + **[pixiv图搜图](http://saucenao.com/)**
    + **[内网穿透](https://ngrok.com)**

---
## linux
```
//aria2c启动指令
aria2c --enable-rpc --rpc-listen-all

//apk内部资源路径
/android_asset/

//挂载目录为可读写
mount -o remount -rw  /

//赋予全读写权限给文件abc
chmod 777 abc

//加锁文件abc
chattr -R +i abc

//解锁文件abc
chattr -R -i abc

//合并文件a和b为文件c
cat a b>c
```
## vim
```
//把每一行的abc替换成cba
:1,$s/abc/cba/g

//把包含abc的行全部删除
:g/abc/d

//在每一行行首添加abc
:%s/^/abc/

//在每一行行尾添加abc
:%s/$/abc/
```
---
> $TERMUX_bps-go.sh
```
#! /bin/bash
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
YOUR CHOOSE IS " choose
if [ $choose = "1" ]
then
    action1
fi
if [ $choose = "2" ]
then
    action2
fi
echo -e "\n\n\n\n\n 输入bdy开始食用\n\n\n    config set -appid=310646 \n\n    cd /apps/baidu_shurufa \n\n    config set -appid=265486 \n\n    config set -savedir /sdcard/Android \n\n"
```

## 音乐
```
白石溪             玉人歌
落花雨             漂亮面对
仙居谣             霜雪千年
山外小楼夜听雨       一半一半
两小无猜           千年食谱颂
前尘如梦           I LOVE U
锦鲤抄             极乐净土
世末歌者           寄明月
深夜诗人           花依世界·凝
葬歌               灰烬
阴阳先生           圈圈点点圈圈点点
骑士背影           我的一个道姑朋友
泠重乞愿           一重加害
二重变革           三重爱恋
四重罪孽           五重空洞
六重不忠           七重诟病
八重回归           九重现实
十重孤独           长夜雨
追光使者           孙尚香
权御天下&操戈天下
```
## 动漫
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
```
## 读书
```
        ┌
        │背景
        │     #FFF5EFD9
        │     RGB (245,239,217,255)
颜色代码 ┤
        │文本
        │     #FF191910
        │     RGB (25,25,16,255)
        └
```
