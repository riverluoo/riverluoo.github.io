## 按照 null 进行排序

默认情况下 mysql 将 null 作为小值

- null 强制放在最前

```sql
if(isnull(字段名),0,1) asc
```

- null 强制放在最后

```sql
if(isnull(字段名),0,1) dsc

if(isnull(字段名),1,0)  asc
```

以 if(isnull(字段名),0,1)为例，它的意思是将该字段根据是否为 null 值分成两部分，
值为 null 行相当于得到了一个隐含的排序属性 0，值为非 null 的行相当于得到了一个隐含的排序属性 1，
在排序的时候，先根据这一隐含属性进行升序排列，因为 if(isnull(字段名),0,1)相当于 if(isnull(字段名),0,1)
asc 省略了 asc 而已，所以自然地，排序字段为 null 的那些行（隐含排序属性）会在最前

# 统计分析函数

## day

```sql
SELECT
DATE(a.create_time) AS time
FROM statistics_consumption a
GROUP BY DATE(a.create_time)
ORDER BY DATE(a.create_time) DESC;
```

## week

```sql
SELECT
WEEK(a.create_time) AS time,
a.create_time
FROM statistics_consumption a
GROUP BY WEEK(a.create_time)
ORDER BY WEEK(a.create_time) DESC;
```

## month

```sql
SELECT
MONTH(a.create_time) AS time,
a.create_time
FROM statistics_consumption a
GROUP BY MONTH(a.create_time)
ORDER BY MONTH(a.create_time) DESC;
```

## year

```sql
SELECT
YEAR(a.create_time) AS time,
a.create_time
FROM statistics_consumption a
GROUP BY YEAR(a.create_time)
ORDER BY YEAR(a.create_time) DESC;
```

## 拼接函数

```sql
CONCAT( DATE_FORMAT( NOW( ), '%Y' ), '-', MONTH ( consumption.create_time ) )
```

## 周开始和结束日期

```sql
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

```

## 一、 week（）

#### 是什么

[官方手册](https://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html)
![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190104124614.png)
函数返回的是周数，可以使用两个参数，mode 可以省略，使用 default-week-format 系统变量的值

#### 什么用

- 获取日期所在的周数
- 数据按照周进行统计

#### 如何使用

- 如果包含 1 月 1 日的一周在新的一年中有 4 天或更多天，则为第 1 周
- 否则，它是上一年的最后一周，下一周是第 1 周

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190104132557.png)

- 7
  范围 1-53 周
  从 0101 开始计算,第 1 周是今年星期一,上周为去年的最后一周
  ```sql
  SELECT WEEK('2019-01-01',7);
  - 53
  SELECT WEEK('2019-01-07',7)
  - 1
  ```
- 5
  范围 0-53 周
  从今年 0101 开始计算,第 1 周是今年星期一,上周为第 0 周
  ```sql
  SELECT WEEK('2019-01-01',5)
  - 0
  SELECT WEEK('2019-01-07',5)
  - 1
  ```
- 3
  范围 1-53 周
  从 0101 开始计算,第 1 周在今年有 4 天或更多天,不够则为去年最后一周
  ```sql
  SELECT WEEK('2019-01-01',3)
  - 1
  SELECT WEEK('2017-01-01',3)
  - 52
  ```
- 1
  范围 0-53 周
  从 0101 开始计算,第 1 周是在今年有 4 天或更多天,不够则为第 0 周
  ```sql
  SELECT WEEK('2019-01-01',1)
  - 1
  SELECT WEEK('2017-01-01',1)
  - 0
  ```
