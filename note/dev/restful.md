## 一、什么是 RESTful

REST 全称是 Representational State Transfer 中文含义为表现层状态转化 ，表现层其实值得是“资源”(Resources)的“变现层”

- Resources
  所谓"资源"，就是网络上的一个实体，或者说是网络上的一个具体信息。它可以是一段文本、一张图片、一首歌曲、一种服务，总之就是一个具体的实在。
  你可以用一个 URI（统一资源定位符）指向它，每种资源对应一个特定的 URI。要获取这个资源，访问它的 URI 就可以，因此 URI 就成了每一个资源的地址或独一无二的识别符。
- Representation
  "资源"是一种信息实体，它可以有多种外在表现形式。我们把"资源"具体呈现出来的形式，叫做它的"表现层"（Representation）。
  比如，文本可以用 txt 格式表现，也可以用 HTML 格式、XML 格式、JSON 格式表现，甚至可以采用二进制格式；图片可以用 JPG 格式表现，也可以用 PNG 格式表现。
- State Transfer
  互联网通信协议 HTTP 协议，是一个无状态协议。这意味着，所有的状态都保存在服务器端。因此，如果客户端想要操作服务器，必须通过某种手段，让服务器端发生"状态转化"（State Transfer）。
  而这种转化是建立在表现层之上的，所以就是"表现层状态转化"。客户端用到的手段，只能是 HTTP 协议。具体来说，就是 HTTP 协议里面，四个表示操作方式的动词：GET、POST、PUT、DELETE。
  它们分别对应四种基本操作：GET 用来获取资源，POST 用来新建资源（也可以用于更新资源），PUT 用来更新资源，DELETE 用来删除资源。

* 1:每一个 URI 代表一种资源
* 2:客户端和服务器之间，传递这种资源的某种表现层
* 3:客户端通过四个 HTTP 动词，对服务器端资源进行操作，实现"表现层状态转化"

## 二、 为什么使用RESTful

* 接口抽象
RESTful 服务使用标准的 HTTP 方法 (GET/PUT/POST/DELETE) 来抽象所有 Web 系统的服务能力
* 无状态性
HTTP 协议从本质上说是一种无状态的协议，客户端发出的 HTTP 请求之间可以相互隔离，不存在相互的状态依赖


## 三、 怎样使用RESTful

## 四、 版本演进
* 1: 在uri中 GET /v1/user
* 2: Accept Header：Accept: application/json+v1
* 3: 自定义 Header：X-Api-Version: 1
