#!/bin/bash
function choose1(){
	echo -e "你选择了 选项1"
}
function choose2(){
	echo -e "你选择了 选项2"
}
echo -e "\n\n\n
————————————————————————————————————
＜
＜            TermuxSh
＜
＜   纪念： 我的第一个 bash 小工具
＜
————————————————————————————————————
＜
＆ 1)    选项 1
＜
＆ 2)    选项 2
＜
————————————————————————————————————
\n"
read -p "你的选择是？[1/2] " choose
if [ $choose = 1 ] ; then
	choose1
fi
if [ $choose = 2 ] ; then
	choose2
fi
