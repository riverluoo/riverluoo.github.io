## 按照null 进行排序
默认情况下  mysql 将null作为小值
- null 强制放在最前
~~~sql
if(isnull(字段名),0,1) asc 
~~~
- null 强制放在最后
~~~sql
if(isnull(字段名),0,1) dsc   

if(isnull(字段名),1,0)  asc
~~~
以if(isnull(字段名),0,1)为例，它的意思是将该字段根据是否为null值分成两部分，
值为null行相当于得到了一个隐含的排序属性0，值为非null的行相当于得到了一个隐含的排序属性1，
在排序的时候，先根据这一隐含属性进行升序排列，因为if(isnull(字段名),0,1)相当于if(isnull(字段名),0,1)
asc省略了asc而已，所以自然地，排序字段为null的那些行（隐含排序属性）会在最前


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

## 周开始和结束日期
~~~sql
 SELECT year, week, x.start, ADDDATE(x.start, 6) AS end
   FROM (
 SELECT ADDDATE(jan1, (t.week - WEEK(jan1, 5)) * 7 - WEEKDAY(jan1)) AS start, year, week
   FROM (SELECT MAKEDATE(`year`, 1) AS jan1, year, week FROM t_table) t
 ) x;

+------+------+------------+------------+
| year | week | start      | end        |
+------+------+------------+------------+
| 2011 |    1 | 2011-01-03 | 2011-01-09 |
| 2011 |    2 | 2011-01-10 | 2011-01-16 |
| 2011 |    3 | 2011-01-17 | 2011-01-23 |
| 2011 |   52 | 2011-12-26 | 2012-01-01 |
+------+------+------------+------------+

~~~