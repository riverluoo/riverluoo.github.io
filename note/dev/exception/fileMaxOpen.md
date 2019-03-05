## 错误日志

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120190718.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120190745.png)

## openFiles

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120202222.png)

- 实际打开的文件数
  ![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120202321.png)
- 实际打开的文件
  ```
  /proc/8494
  ll fd
  ```
  ![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120202703.png)

## 修改配置文件

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120202359.png)

```
* soft nofile 65536
* hard nofile 131072
* soft nproc 2048
* hard nproc 4096
```

## 重启 message 模块

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190120202518.png)
