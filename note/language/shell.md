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

- 自定义变量
- Linux 已定义的环境变量
- Shell 变量
