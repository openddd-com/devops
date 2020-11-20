    grep{

        -c    # 显示匹配到得行的数目，不显示内容
        -h    # 不显示文件名
        -i    # 忽略大小写
        -l    # 只列出匹配行所在文件的文件名
        -n    # 在每一行中加上相对行号
        -s    # 无声操作只显示报错，检查退出状态
        -v    # 反向查找
        -e    # 使用正则表达式
        -w    # 精确匹配
        -wc   # 精确匹配次数
        -o    # 查询所有匹配字段
        -P    # 使用perl正则表达式
        -A3   # 打印匹配行和下三行
        -B3   # 打印匹配行和上三行
        -C3   # 打印匹配行和上下三行

        grep -v "a" txt                              # 过滤关键字符行
        grep -w 'a\>' txt                            # 精确匹配字符串
        grep -i "a" txt                              # 大小写敏感
        grep  "a[bB]" txt                            # 同时匹配大小写
        grep '[0-9]\{3\}' txt                        # 查找0-9重复三次的所在行
        grep -E "word1|word2|word3"   file           # 任意条件匹配
        grep word1 file | grep word2 |grep word3     # 同时匹配三个
        echo quan@163.com |grep -Po '(?<=@.).*(?=.$)'                           # 零宽断言截取字符串  #　63.co
        echo "I'm singing while you're dancing" |grep -Po '\b\w+(?=ing\b)'      # 零宽断言匹配
        echo 'Rx Optical Power: -5.01dBm, Tx Optical Power: -2.41dBm' |grep -Po '(?<=:).*?(?=d)'           # 取出d前面数字 # ?为最小匹配
        echo 'Rx Optical Power: -5.01dBm, Tx Optical Power: -2.41dBm' | grep -Po '[-0-9.]+'                # 取出d前面数字 # ?为最小匹配
        echo '["mem",ok],["hardware",false],["filesystem",false]' |grep -Po '[^"]+(?=",false)'             # 取出false前面的字母
        echo '["mem",ok],["hardware",false],["filesystem",false]' |grep -Po '\w+",false'|grep -Po '^\w+'   # 取出false前面的字母

        grep用于if判断{

            if echo abc | grep "a"  > /dev/null 2>&1
            then
                echo "abc"
            else
                echo "null"
            fi

        }

    }