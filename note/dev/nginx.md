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

