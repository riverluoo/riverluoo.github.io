# 一 location的匹配规则 

##  location的匹配规则
先匹配普通 再匹配正则

##  location 的执行逻辑和编辑顺序的关系
普location和编辑顺序无关 正则location和编辑顺序有关
正则 location 匹配让步普通 location 的严格精确匹配结果；但覆盖普通 location 的最大前缀匹配结果

## 分类
* 正则
“~ ”和“~* ”前缀表示正则location ，“~ ”区分大小写，“~* ”不区分大小写
* 普通
“=”，“^~ ”和“@ ”和无任何前缀的都属于普通location

##  “@” 前缀
这种“Named Location ”不是用来处理普通的HTTP 请求的，用来处理“内部重定向（internally redirected ）”请求的

# 二 转发tcp请求

业务场景需要nginx转发自定义的tcp请求到内网的ip和端口 

- [官方文档](http://nginx.org/en/docs/stream/ngx_stream_core_module.html#stream)
从1.9版本开始 nginx 对转发tcp和udp进行了支持


~~~
stream {
    upstream ia{
        server 00.00.00.00:20000 max_fails = 3 fail_timeout = 30s;
    }
    server {
        proxy_connect_timeout 1s;
        proxy_timeout 3s;
        listen 18091;
        proxy_pass ia;
    }

}
~~~

## 遇到的问题

- [使用Nginx转发TCP/UDP](https://www.jianshu.com/p/244386221cc5)
- [./configure: error: C compiler cc is not found](https://blog.csdn.net/testcs_dn/article/details/51461750)
- [No rule to make target `build', needed by `default'. Stop.](https://blog.csdn.net/cailongbiaoyuli/article/details/84348866)
- [关闭防火墙](https://blog.csdn.net/ytangdigl/article/details/79796961)
- [替换安装方式](https://www.cnblogs.com/juanjuankaikai/p/9598976.html)
- [动态模块](http://www.sohu.com/a/59138683_354963)




