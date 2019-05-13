---
title: java多线程
date: 2018-10-12
layout: post
---

## 生成环境定时任务有遗漏

### 异常日志

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190409105102.png)

### 正常日志

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190409105123.png)

确定是定时任务阻塞，其中一个任务执行时间过长，导致其他任务无法执行

- [定时任务使用](https://www.cnblogs.com/yihuihui/p/9416102.html)

### 关于 spring 定时任务



### 启动异步调用

```java
@EnableScheduling
@EnableAsync
@Configuration
public class CronConfiguration {
}
```

### 使用异步调用

```java
@Scheduled(cron = "0/30 * * * * ? ")
@Async
protected void addTotalFlow() {
    log.info("CronJob#addTotalFlow");
}
```

### 新的问题

这样方式，每次执行都会启一个新的线程去执行，操作系统有最大线程数的限制<br>
不加处理的，会导致进程挂掉。

### 查询当前整个系统已用的线程或进程数

```shell
pstree -p | wc -l
```

### 多线程的方式

```java
@Bean
public AsyncTaskExecutor asyncTaskExecutor() {
    ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
    executor.setThreadNamePrefix("cron-job-");
    executor.setMaxPoolSize(50);
    executor.setCorePoolSize(10);
    executor.setQueueCapacity(400);
    executor.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());
    return executor;
}
```
