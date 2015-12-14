# 命令行下的交互式UI设计

这个一个脚本函数库，旨在各位在编写命令行执行脚本的时候，也能够有充足的交互式函数可以使用。

## 使用方法
如果你希望使用这个函数库那么你需要代码库中的function.sh这个文件.

在Linux 下你可以这么做:

``` bash
    git clone https://github.com/qianyingshuo/Terminal-interactive-UI-Function.git
    cp ./Terminal-interactive-UI-Function/function.sh <your own dir>
```

然后在你编写脚本的时候加入这一句：
```bash
    source function.sh
```
就好了。
## 已有函数

###loopDot函数组
这个函数组主要提供了一个等待进度条的功能，效果如下：
![loopDot函数组效果](https://github.com/qianyingshuo/Terminal-interactive-UI-Function/blob/master/img/loopDot001.gif)

####函数使用
loopDot函数组主要包含以下函数：
1. loopDotBEGIN
2. loopDotEND
这两个函数分别使用在，你希望包含程序的首尾。使其包含住你的主要处理逻辑。
在你的脚本即将进入一段很长的安静处理阶段前调用loopDotBEGIN函数，加入你希望
的等待进度条的长度，在你准备输出自己的处理的信息前调用loopDotEND函数。

的test代码如下，假设我主要的处理函数就是sleep 30秒：
``` bash
    source function.sh

    echo "Hello World";
    loopDotBEGIN 15;
    sleep 30;
    loopDotEND
    echo "Well Done";
```
####API参考
**loopDotBEGIN**
函数只需要一个参数，这个参数是一个数字，输入非数字的参数，效果将是未知的。
**loopDotEND**
函数不需要任何参数，直接调用即可。
####函数组注意事项
函数组用到了两个保留的全局变量：
* DOTNUM
* DOTPID

不要试图在你的处理逻辑中改变这两个变量，函数暂不支持多线程或者多进程操作。
