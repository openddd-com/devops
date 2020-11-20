#!/bin/sh                             # 在脚本第一行脚本头 # sh为当前系统默认shell,可指定为bash等shell

shopt                                 # 显示和设置shell中的行为选项
sh -x                                 # 执行过程
sh -n                                 # 检查语法
set -e                                # 若指令传回值不等于0，则立即退出shell
(a=bbk)                               # 括号创建子shell运行
basename /a/b/c                       # 从全路径中保留最后一层文件名或目录
dirname                               # 取路径
$RANDOM                               # 随机数
$$                                    # 进程号
source FileName                       # 在当前bash环境下读取并执行FileName中的命令  # 等同 . FileName
sleep 5                               # 间隔睡眠5秒
trap                                  # 在接收到信号后将要采取的行动
trap "" 2 3                           # 禁止ctrl+c
$PWD                                  # 当前目录
$HOME                                 # 家目录
$OLDPWD                               # 之前一个目录的路径
cd -                                  # 返回上一个目录路径
local ret                             # 局部变量
yes                                   # 重复打印
yes |rm -i *                          # 自动回答y或者其他
ls -p /home                           # 区分目录和文件夹
ls -d /home/                          # 查看匹配完整路径
time a.sh                             # 测试程序执行时间
echo -n aa;echo bb                    # 不换行执行下一句话 将字符串原样输出
echo -e "s\tss\n\n\n"                 # 使转义生效
echo $a | cut -c2-6                   # 取字符串中字元
echo {a,b,c}{a,b,c}{a,b,c}            # 排列组合(括号内一个元素分别和其他括号内元素组合)
echo $((2#11010))                     # 二进制转10进制
echo aaa | tee file                   # 打印同时写入文件 默认覆盖 -a追加
echo {1..10}                          # 打印10个字符
printf '%10s\n'|tr " " a              # 打印10个字符
pwd | awk -F/ '{ print $2 }'          # 返回目录名
tac file |sed 1,3d|tac                # 倒置读取文件  # 删除最后3行
tail -3 file                          # 取最后3行
outtmp=/tmp/$$`date +%s%N`.outtmp     # 临时文件定义
:(){ :|:& };:                         # fork炸弹,系统执行海量的进程,直到系统僵死
echo -e "\e[32mcolour\e[0m"           # 打印颜色
echo -e "\033[32mcolour\033[m"        # 打印颜色
echo -e "\033[0;31mL\033[0;32mO\033[0;33mV\033[0;34mE\t\033[0;35mY\033[0;36mO\033[0;32mU\e[m"    # 打印颜色