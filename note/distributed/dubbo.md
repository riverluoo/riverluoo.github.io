## 说一下的 dubbo 的工作原理

- service 接口层 服务提供者和消费者实现
- config 配置层 对 bubbo 进行各种配置
- proxy 代理层 bubbo 会对生产者和消费者提供代理，代理间进行通信
- register 服务注册层 服务注册
- cluster 集群层 封装多个服务提供者的路由以及负载均衡
- monitor 监控层 对 rpc 接口的调用次数和时间进行监控
- protacal 远程调用层 封转 rpc 调用
- exchange 信息交换层 封装请求响应模式 同步转异步
- transport 网络传输层
- serialize 数据序列化层

## 工作流程

- 服务提供者 provider 向注册中心去注册
- 消费者 consumer 从注册中心订阅服务 注册中心会通知 consumer 注册好的服务
- consumer 调用 provider
- consumer 和 provider 异步通知监控中心

## 注册中心挂了可以继续通信吗

注册中心中任意一台机器宕机之后，可以切换到另一台主机上。如果所有的主机都宕机了，还可以依赖本地缓存进行通信。
因为刚开始初始化的时候，消费者会将提供者的地址等信息拉取到本地缓存，所以注册中心挂了可以继续通信

## dubbo 支持哪些序列化协议

序列化 把数据结构或者一些对象，转换为二进制串的过程<br>
房序列化 把生成的二进制串转换为数据结构或者对象的过程

- dubbo 协议
- rmi 协议
- hessian 协议
- http 协议
- webservice

## hessian 的数据结构

原始类型

- 原始二进制数据
- boolean
- 64-bit date
- b4-bit double
- 32-bit int
- 64-bit long
- null
- UTF-8 编码的 String

递归类型

- list for lists and arrays
- map for maps and dictionaries
- object for objects

特殊类型

- ref 表示对共享对象的引用
