## 线上 cup100%

展示系统资源占用

```
top-c
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620190217.png)

java 进程

```
pm2 l
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620191203.png)

导出内存快照

```
jmap -dump:live,format=b,file=dump.hprof 6779
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190621094135.png)

```
pm2 log
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620100902.png)

进程内的线程

```
ps -mp 6779 -o THREAD,tid,time | sort -rn
```

线程快照中线程 ID 都是 16 进制存放

```
printf "%x\n" tid 26170
printf "%x\n" tid 26169
printf "%x\n" tid 26174
printf "%x\n" tid 26196
printf "%x\n" tid 26197
printf "%x\n" tid 26190
printf "%x\n" tid 26175
printf "%x\n" tid 26171
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620101451.png)
![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190621094947.png)

gc 情况

```
jstat -gcutil 6779 200 50
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620102013.png)

线程栈 dump 到日志文件

```
jstack 6779 >> java.log
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620190626.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620190720.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190620191057.png)

## 总结

- 1:gc 情况还是比较正常
- 2:有一个接口的执行非常耗时
- 3:在拼接 sql 使用的是 in,数据量过大

## 参考资料

- [Java 线上应用故障排查之一：高 CPU 占用](https://www.cnblogs.com/paul8339/p/7464206.html)
- [又一次生产 CPU 高负载排查实践](https://mp.weixin.qq.com/s?__biz=MzIyMzgyODkxMQ==&mid=2247484230&idx=1&sn=f5b7987bd7deadf728de97b20a979bb9&chksm=e8190d86df6e84909f9e5f3a948dcda04ad7d8ad5959abf00c04e631779b2e8fa698f64ff897&scene=27#wechat_redirect)
- [分析平台](https://fastthread.io)