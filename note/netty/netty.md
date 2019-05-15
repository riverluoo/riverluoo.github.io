## netty 的核心概念
- Channel 一个客户端与服务器通信的通道
- ChannelHandle 业务逻辑处理器，分为ChannelInboundHandler和ChannelOutboundHandler
- ChannelPipeline 用于存放ChannelHandler的容器
- ChannelContext 通信管道的上下文

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20181116173618.png)


在底层操作系统中是按照字节流发送数据的，数据到了服务端，也是安装字节流的方式读取<br>
服务端读取的顺序和发送的顺序可能是不对等的，我们需要在客户端自定义协议来组装我们应用层的数据包<br>
然后在服务端根据我们的应用层的协议来组装数据包，这个过程在服务端称为拆包，在客户端成为粘包。


