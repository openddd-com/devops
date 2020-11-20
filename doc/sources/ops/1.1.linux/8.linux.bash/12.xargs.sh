xargs{

        # 命令替换
        -t 先打印命令，然后再执行
        -i 用每项替换 {}
        find / -perm +7000 | xargs ls -l                    # 将前面的内容，作为后面命令的参数
        seq 1 10 |xargs  -i date -d "{} days " +%Y-%m-%d    # 列出10天日期

    }