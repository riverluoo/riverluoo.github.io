## 1. 包含#的url是什么
~~~
https://riverluoo.com/#/note/language/git
~~~
包含 # 的url是一个fragment url, # 指定了网页中的一个位置

## 2.http请求不包括#
 仅作用浏览器，不会影响到服务端
 
~~~
https://riverluoo.com/index.html#note
~~~
浏览器实际发出请求
~~~
GET /index.html HTTP/1.1
Host:riverluoo.com
~~~

## 3. 被浏览器当作位置标志符

如果提交的字符中带有#字符，后面的参数会被截断

## 4.改变#不触发网页重载
改变#后面的部分，浏览器只会滚动到响应的位置，不会重新加载网页
~~~
https://riverluoo.com/index.html#note1
~~~
改成
~~~
https://riverluoo.com/index.html#note2
~~~
浏览器不会向服务器重新请求index.html