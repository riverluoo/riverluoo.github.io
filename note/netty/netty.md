## netty 的核心概念
- Channel 一个客户端与服务器通信的通道
- ChannelHandle 业务逻辑处理器，分为ChannelInboundHandler和ChannelOutboundHandler
- ChannelPipeline 用于存放ChannelHandler的容器
- ChannelContext 通信管道的上下文

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20181116173618.png)
