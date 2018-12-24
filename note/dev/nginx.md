##  location的匹配规则
先匹配普通 再匹配正则

##  location 的执行逻辑和编辑顺序的关系
普location和编辑顺序无关 正则location和编辑顺序有关
正则 location 匹配让步普通 location 的严格精确匹配结果；但覆盖普通 location 的最大前缀匹配结果

##  