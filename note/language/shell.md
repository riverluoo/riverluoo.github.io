## 一 什么是 Shell

Shell 编程就是对一堆 Linux 命令的逻辑化处理

## 二 HelloWorld

```shell
touch hello.sh
```

```shell
#!bin/bash

echo "helloworld!"
```

```shell
chmod +x hello.sh
```

hell 中 # 符号表示注释。shell 的第一行比较特殊，一般都会以#!开始来指定使用的 shell 类型。
在 linux 中，除了 bash shell 以外，还有很多版本的 shell， 例如 zsh、dash 等等...

## 三 Shell 变量

- Linux 已定义的环境变量
- 自定义变量
- Shell 变量

已定义的环境变量

```shell
echo $HOME
echo $JAVA_HOME
echo $SHELL
```

使用自定义变量

```shell
#!/bin/bash
name="jurry"
echo $name
```

## 变量命名的注意事项

- 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头,可以使用下划线开头
- 中间不能有空格，可以使用下划线
- 不能使用标点符号
- 不能使用 bash 里的关键字

## 字符串

字符串是 shell 里最常用的数据类型，另外还有数字

### 可以使用单引号或双引号

```shell
#!/bin/bash
# 单引号
name='jurry'
echo $name

# 双引号
age="12"
echo $age
```

### 字符串长度

```shell
#!/bin/bash
name='jurry'
echo $name

echo ${#name}
```

### 字符串截取

从第一个字符开始 截取两个字符

```shell
name='jurry'
echo $name

echo ${name:0:2}
```

## 基本运算符

### 算数运算符

- \+
- \-
- \*
- /
- %
- =
- ==
- !=

### 关系运算符

- -eq
- -ne
- -gt
- -lt
- -ge
- -le

### 逻辑运算符

- &&
- ||

### 布尔运算符

- !
- -o
- -a

### 字符串运算符

- =
- !=
- -z
- -n
- str

### 文件相关运算符

## 流程控制

### if

```shell
#!/bin/bash

a=1;
b=2;
if [ $a = $b ]
then
   echo "a 等于 b"
elif [ $a > $b ]
then
   echo "a 大于 b"
else
   echo "a 小于 b"
 fi
```

if fi 必须成对出现

### for

- 循环列表中的数据

```shell
#!/bin/bash

for loop in j u r r y
do
    echo "The value is: $loop"
done
```

- 循环

```shell
#!/bin/bash

for((i=1;i<=5;i++));
do
    echo $i;
done;
```

### while

- 基本 while 循环

```shell
#!/bin/bash

int=1
while(( $int<=10 ))
do
    echo $int
    let "int++"
done
```

### case

```shell
#!/bin/bash

CMD=$1
shift
case $CMD in
    'build')
       build $@
    ;;
    'stop')
        echo '停止...'
     stop $@
    ;;
    'start')
        echo '前台启动...'
    start $@
    ;;
    'startd')
        echo '后台启动...'
    startd $@
    ;;
    *)
        echo '错误的指令，请检查'
    ;;
esac
```

### 函数

- \$# 传入参数个数
- \$\* 所有传入参数
- \$@ 所有传入参数 被双引号(" ")包含时 与\$\* 不同
- \$? 函数返回值

```shell
#!/bin/bash

fun(){
    echo "$1"
    echo "$2"
    echo "$10"
    echo "${10}"
    echo "${11}"
    echo "$#"
    echo "$*"
}
fun 1 2 3 4 5 6 7 8 9 13 15
```

```
1
2
10
13
15
11
1 2 3 4 5 6 7 8 9 13 15
```

在函数体内部，通过 n 的形式来获取参数的值，例如，1 表示第一个参数，\$2 表示第二个参数
10 不能获取第十个参数，获取第十个参数需要{10}

### $* 和$@ 的区别

加引号后,$*把参数作为一个字符串整体(单字符串)返回,$@把每个参数作为一个字符串返回

```shell
#!/bin/bash

fun() {
    echo "未加引号,二者相同"
    echo $*
    echo $@
    echo "加入引号后对比"
    for N in "$*"
    do
        echo $N
    done

    echo "----------"
    for N in "$@"
    do
    echo $N
    done
 }
fun  aa bb cc dd
```

```
未加引号,二者相同
aa bb cc dd
aa bb cc dd
加入引号后对比
aa bb cc dd
----------
aa
bb
cc
dd
```
## 可执行
~~~
chmod 755 xx.sh
~~~
