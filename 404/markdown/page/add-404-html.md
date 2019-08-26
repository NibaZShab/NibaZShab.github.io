---
title: 公益网站项目的添加
date: 2019-08-4 02:11:06
---

![](/404/markdown/picture/16.png)
话不多说，直接开始吧。首先，在网站根目录下，创建一个``404``页面
```sh
echo "" >> 404.html
```
把以下代码添加进去：
```html
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8" />
         <title>404</title>                                                                                                                                        
    </head>
    <body>
         <script type="text/javascript" src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js" homePageName="返回首页" homePageUrl="这里填入你的网站的首页地址"></script>
    </body>
</html>
```
保存，退出，这样``公益404``页面就添加完成了

---
# 完