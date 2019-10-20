#!/bin/bash
echo ""
echo ""
echo ""
usage() {
    cat <<EOF
EOF
}
main() {
    echo "猜分数赢大奖 （0-100）"
    echo "请选择难度:"
    echo "-----------------------------------------"
    echo "1，试下牛刀：50-100，7次机会"  
    echo "2，不过尔尔：0- 100，7次机会"
    echo "3，俯视众生：50-100，4次机会"
    echo "4，我是菜鸟：0- 100，4次机会"
    echo "5，我是主宰：50-100，2次机会"
    echo "6，上帝视角，0- 100，2次机会"
    echo "-----------------------------------------"
    echo ""
    read -p "输入当前关卡难度：" difficulty
    case $difficulty in
        1 )
            init_num=50
            max_try=7
            echo "游戏难度级别：1，玩的开心"
            ;;
        2 )
            init_num=1
            max_try=7
            echo "游戏难度级别：2，祝你好运"
            ;;
        3 )
            init_num=50
            max_try=4
            echo "游戏难度级别：3，学霸你好"
            ;;
        4 )
            init_num=1
            max_try=4
            echo "游戏难度级别：4，大牛你好"
            ;;
        5 )
            init_num=50
            max_try=2
            echo "游戏难度级别：5，珍爱生命"
            ;;
        6 )
            init_num=1
            max_try=2
            echo "游戏难度级别：6，上帝你好"
            ;;
        * )
            init_num=50
            max_try=1
            echo "恭喜你获得隐藏关卡：地狱模式"
            ;;
    esac
    bingo_num=$[RANDOM%100]
    lucky_num=$[$bingo_num + $init_num]
    if [[ $lucky_num -gt 100 ]]; then
        lucky_num=$bingo_num
    fi
    for (( i = 1; i <= $max_try; i++ )); do
        case $i in
            1) read -p "游戏开始，请输入你的分数：" GRADE
                ;;
            *) read -p "请再次输入你的分数：" GRADE
                ;;
        esac
        result=$[$GRADE-$lucky_num]
        if [[ $result -ge 50 && $result -le 100 ]]; then
            echo "你的分数：$GRADE ！ 远远大于幸运号码"
        elif [[ $result -ge 10 && $result -le 49 ]]; then
            echo "你的分数：$GRADE 分！ 稍微大于幸运号码"
        elif [[ $result -gt 0 && $result -le 10 && $result -ne 0 ]]; then
            echo "你的分数：$GRADE 分！ 就比幸运号码大一丢丢啦"
        elif [[ $result -ge -10 && $result -lt 0 && $result -ne 0 ]]; then
            echo "你的分数：$GRADE 分！ 离幸运号码就差一小丢丢"
        elif [[ $result -eq 0 ]]; then
            echo ""
            echo "BINGO!!! 恭喜！！！！"
            echo "幸运号码：$lucky_num，请带上身份证原件还有299元手续费来领奖 "
            case $difficulty in
                3 ) echo "学霸带我一起飞吧" ;;
                4 ) echo "大牛给个大腿吧" ;;
                5 ) echo "少年传授你一本绝世秘籍吧" ;;
                6 ) echo "上帝快来救救我吧，我被传销迫害" ;;
                * ) echo "你一定是从外星空来的"
                    ;;
            esac
            exit 0
        elif [[ $result -gt -50 && $result -lt -10 ]]; then
            echo "你的分数：$GRADE 分！ 比幸运号码小 "
        elif [[ $result -lt -50 ]]; then
            echo "你的分数：$GRADE 分！ 远远小于幸运号码 "
        fi
        echo "还有 $[$max_try-$i] 次机会"
        echo ""
        if [[ $i -eq $max_try ]]; then
            echo "非常抱歉你的次数你全部用完，离大奖就差一点点。"
            echo "你可以选择："
            echo "-------------------------------------------------"
            echo "1.消费100购买全部次数"
            echo "2.临时工"
            echo "3.试试手气"
            echo "其他任意键盘结束游戏" 
            echo "-------------------------------------------------"
            read -p "请选择：" choose
            echo ""
            case $choose in
                1) 
                    read -p "请输入金额：" money
                    if [[ $money -le 100 ]]; then
                        read -p "确认购买 y/n？" confirm
                        if [[ $confirm == [yY] ]]; then
                            echo "购买成功,信春哥满血复活！"
                            echo ""
                            i=0
                        else
                            echo "没关系，说不定下轮大奖就是你的"
                        fi
                    else
                        echo "金额不对哦，无法购买"
                    fi
                    ;;
                3)
                    echo "天灵灵，地灵灵，请老天再给我一次机会把"
                    echo ""
                    read -p "按任意键试下你的上帝之手吧" lucky_try
                    case $lucky_try in
                        *) echo ""
                        ;;
                    esac
                    guess_again=$[RANDOM+1 % 100]
                    if [[ $GRADE_again -eq $lucky_num ]]; then
                        echo "恭喜你很荣幸的获得上天的眷顾"
                        echo "女神恩赐了你两次机会，请珍惜！"
                        for (( j = 1; j < 2; j++ )); do
                            case $j in
                                0) read -p "请输入你的第一次眷顾：" GRADE_again
                                        ;;
                                *) read -p "请再次输入你的分数：" GRADE_again
                                        ;;
                            esac
                            result_again=$[$GRADE_again-$lucky_num]
                            if [[ $result_again -eq 0 ]]; then
                                echo "大奖号码：$lucky_num 恭喜通过眷顾机会获得超级大奖，通知所有今晚吃鸡翅！！！！"
                                exit 0
                            elif [[ $result -ne 0 ]]; then
                                echo "你此次的眷顾结果运气就差一点点"
                            fi
                            echo "还剩 $[2-$j] 次眷顾机会"
                            echo ""
                        done
                    else
                        echo "没被眷顾倒，运气就差一点点"
                    fi
                    ;;
                *)
                    echo "没关系，说不定下轮大奖就是你的"
            esac
        fi
    done
}
main "$@"
exit 0
