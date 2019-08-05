## TCP 最大连接数

### 1 : 用户级别

```
ulimit -n
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190805225759.png)

### 2 : 系统级别

```
sysctl -a|grep file-max
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190805225851.png)

一般一个端口（即一个进程）的最高连接为 2 的 16 次方 65536,这表明这台 Linux 系统最多允许同时打开(即包含所有用户打开文件数总和)65535 个文件，是 Linux 系统级硬限制，所有用户级的打开文件数限制都不会超过这个数值。
通常这个系统级硬限制是 Linux 系统在启动时根据系统硬件资源状况计算出来的最佳的最大同时打开文件数限制。

### 3 : 当前 tcp 连接

```
netstat -antp |grep -i est |wc -l
```
