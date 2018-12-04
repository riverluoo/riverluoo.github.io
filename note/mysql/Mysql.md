# 按照null 进行排序
## [order by对null进行排序](https://www.cnblogs.com/Wcy100/p/5376399.html)

# 统计分析函数

## day

~~~sql
SELECT 
DATE(a.create_time) AS time
FROM statistics_consumption a
GROUP BY DATE(a.create_time)
ORDER BY DATE(a.create_time) DESC;
~~~

## week
~~~sql
SELECT 
WEEK(a.create_time) AS time,
a.create_time 
FROM statistics_consumption a
GROUP BY WEEK(a.create_time)
ORDER BY WEEK(a.create_time) DESC;
~~~

## month
~~~sql
SELECT 
MONTH(a.create_time) AS time,
a.create_time 
FROM statistics_consumption a
GROUP BY MONTH(a.create_time)
ORDER BY MONTH(a.create_time) DESC;
~~~

## year
~~~sql
SELECT 
YEAR(a.create_time) AS time,
a.create_time 
FROM statistics_consumption a
GROUP BY YEAR(a.create_time)
ORDER BY YEAR(a.create_time) DESC;
~~~

## 拼接函数
~~~sql
CONCAT( DATE_FORMAT( NOW( ), '%Y' ), '-', MONTH ( consumption.create_time ) ) 
~~~