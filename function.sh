#!/bin/bash

#################################################################################
# The MIT License (MIT)
#
# Copyright (c) 2015 GODDOG
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#################################################################################

# 循环点函数组
# 函数组包含以下函数
#      loopDotBEGIN
#      loopDotEND
# 另外还有两个全局变量要保留，DOTNUM 和 DOTPID 一个保存当前屏幕上点的个数，一个保存后台函数的PID
######################################

# function name: loopDot
# in parameter type: number
# descriper: 这个函数的提供了一个等待进度条的实现方法。参数是点的数量。是整个函数组的核心函数。
#            这个函数不直接提供给用户使用。
function loopDot() {
while true; do
    for ((i=0;i < $1; i++)); do
        ((DOTNUM++))
        echo -ne '.';
        sleep 0.5;
    done
    for ((i=0;i<$1; i++)); do
        ((DOTNUM--))
        echo -ne '\b \b';
        sleep 0.5;
    done
done
}

function loopDotKILL(){
kill -9 $DOTPID;
# 这特么是玄学，为什么会成为这个样子？用其他的命令来输出，就仍然会有killed输出，用ps -ef 就没有
# 了，但是只能这么用了。
ps -ef 
}

# function name: loopDotBEGIN
# in parameter type: number
# 开始显示函数，在你的主要耗时的逻辑前调用。入参为数字类型
function loopDotBEGIN() {
DOTNUM=0;
loopDot $1 &
DOTPID=$!;
}

# function name: loopDotEND
# in parameter : None
# descriper : 在你的程序逻辑执行完毕后，运行这个函数，然后在输出你想输出的东西。
function loopDotEND() {
loopDotKILL 1>/dev/null 2>/dev/null;
for ((i=0;i <= $DOTNUM; i++)); do
    echo -ne '\b \b';
done
}
