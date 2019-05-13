---
title: 开发中遇到的问题
date: 2019-04-26
layout: post
---

## 1: dubbo 注册服务很慢

- [记一次本机 InetAddress.getLocalHost()引起的项目启动变慢及解决过程](https://blog.csdn.net/puma_dong/article/details/53096149)

## 2: 无法创建进程

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190506143633.png)

- 有最大进程数限制

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190507105938.png)

解决方式

- 临时解决

- [一次受限于操作系统进程数的 OOM](https://www.cnblogs.com/alipayhutu/p/3298360.html)

```
 ulimit -u 10000
```

- 永久解决

- [linux 修改 max user processes limits](https://blog.csdn.net/bbaiggey/article/details/51004817)

```
/etc/security/limits.d/90-nproc.conf
```

## 3: 一次 kafka 的消息出现等待

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190509102313.png)

- 原因
  kafka 的配置只能有一个消费者
  ![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190510134525.png)
  修改为 16 后重启 kafka
  ![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190510134550.png)

- 常用查询

  ```
  查询 topic
  ./kafka-topics.sh --zookeeper ip:2181 --list
  ```

  ```
  查询 group
  ./kafka-consumer-groups.sh --zookeeper ip:2181  --list
  ```

  ```
  查询一个group的消费情况
  ./kafka-consumer-groups.sh --zookeeper ip:2181 --group group-1 --describe
  ```

  ![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190509150622.png)
