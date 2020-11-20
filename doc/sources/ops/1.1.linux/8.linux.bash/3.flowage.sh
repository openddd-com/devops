流程结构{

    if判断{

        if [ $a == $b ]
        then
            echo "等于"
        elif [ $a > $b ]
            echo "大于"
        else
            echo "小于"
        fi

    }

    case分支选择{

        case $xs in
        0) echo "0" ;;
        1) echo "1" ;;
        *) echo "其他" ;;
        esac

    }

    while循环{

        # while true  等同   while :
        # 读文件为整行读入
        num=1
        while [ $num -lt 10 ]
        do
        echo $num
        ((num=$num+2))
        done
        ###########################
        grep a  a.txt | while read a
        do
            echo $a
        done
        ###########################
        while read a
        do
            echo $a
        done < a.txt

    }

    for循环{

        # 读文件已空格分隔
        w=`awk -F ":" '{print $1}' c`
        for d in $w
        do
            $d
        done
        ###########################
        for ((i=0;i<${#o[*]};i++))
        do
        echo ${o[$i]}
        done

    }

    until循环{

        #  当command不为0时循环
        until command
        do
            body
        done

    }

    流程控制{

        break N     #  跳出几层循环
        continue N  #  跳出几层循环，循环次数不变
        continue    #  重新循环次数不变

    }

}