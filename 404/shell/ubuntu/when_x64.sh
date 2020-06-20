#!/bin/bash
echo
echo "
+ --- + ------------------------ +
+  1  +          测网速          +
+ --- + ------------------------ +
+  2  +           zsh            +
+ --- + ------------------------ +
+  3  +          阿里源          +
+ --- + ------------------------ +
+  0  +           退出           +
+ --- + ------------------------ +
"
echo
UBUNTU_WHEN () {
    cd ~
    echo -ne "\033[36m~ # \033[0m" && read UBUNTU_WHEN_WHICH
    case $UBUNTU_WHEN_WHICH in
        1 )
            if test /bin/wget ; then
				:
			else
                echo "安装依赖..." && sleep 1 
				apt install -y wget
			fi
			i=0
			while [ $((i++)) -le 999 ]
			do
				wget -O /dev/null http://dlied5.myapp.com/myapp/1104466820/sgame/2017_com.tencent.tmgp.sgame_h8218_1.43.1.15_fc9dc4.apk
			done ;;
        2 )
            apt install -y zsh && chsh -s /bin/zsh
            if test .oh-my-zsh ; then
                rm -rf .oh-my-zsh
            else
                :
            fi
            sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
            sed -i 's/robbyrussell/af-magic/g' .zshrc
            echo "plugins=(git zsh-autosuggestions)" >> .zshrc
            echo "zsh 终端配置完成" && echo
            UBUNTU_WHEN ;;
        3 )
            echo "
            deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
            deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
            deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
            deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
            deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
            " > /etc/apt/sources.list
            apt update
            echo "换源成功" && echo
            UBUNTU_WHEN ;;
        0 )
            echo
            exit 0 ;;
        * )
            echo && echo "?" && echo && sleep 1
			UBUNTU_WHEN ;;
    esac
}
UBUNTU_WHEN
exit 0