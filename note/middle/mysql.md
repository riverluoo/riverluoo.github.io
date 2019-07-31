## 1: 按照 null 进行排序

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

# 2 : 统计分析函数

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

## 3: week（）

### 是什么

[官方手册](https://dev.mysql.com/doc/refman/5.6/en/date-and-time-functions.html)
![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190104124614.png)
函数返回的是周数，可以使用两个参数，mode 可以省略，使用 default-week-format 系统变量的值

### 什么用

- 获取日期所在的周数
- 数据按照周进行统计

### 如何使用

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

### 应用

- 计算某一日期的周开始
  ```sql
  SELECT DATE_FORMAT(
    ADDDATE(
      MAKEDATE( DATE_FORMAT( '2019-01-08', '%Y' ), 1 ),
      ( WEEK ( '2019-01-08', 5 ) - WEEK ( MAKEDATE( DATE_FORMAT( '2019-01-08', '%Y' ), 1 ), 5 ) ) * 7 - WEEKDAY( MAKEDATE( DATE_FORMAT( '2019-01-08', '%Y' ), 1 ) )
    ),
  '%Y-%m-%d'
  )
  ```
- 周结束
  周开始加 6 天

# 4: explan

要了解索引 先来了解下 explan

- id
  是一组数字，标示查询总的执行 select 或操作表的顺序

```sql
EXPLAIN SELECT
	log.ip
FROM
	upms_log log
	LEFT JOIN upms_user USER ON log.username = USER.username
	LEFT JOIN upms_user_organization org ON USER.user_id = org.user_id
ORDER BY
	log.start_time DESC
```

id 相同，执行顺序由上至下

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190507112719.png)

```sql
EXPLAIN SELECT
	log.ip
FROM
	upms_log log
	LEFT JOIN upms_user USER ON log.username = USER.username
	LEFT JOIN upms_user_organization org ON USER.user_id = org.user_id
WHERE
	log.log_id = ( SELECT log_id FROM upms_log WHERE start_time = 1553060552013 );
```

有子查询，id 的序号会递增，id 值越大优先级越高，先被执行

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190507131314.png)

- select_type
  a. simple : 查询中不包含子查询或者 union
  b. primary : 查询中包含任何复杂的子查询，最外层查询标记
  c. subquery : 在 select 或者 where 列表中包含子查询
  d. derived : 用来表示包含在 from 子句中的子查询 select ,mysql 会递归执行，并将结果放到一个临时表中

* type

all , index , range. ref , eg_ref, const, system, null

有左到右 性能从最差到最好

all : mysql 将遍历全表已找到匹配的行
index : 只遍历索引树
range : 对索引的扫描开始与某一点，返回匹配值的行，是带有 between 或者 where 子局中带有< > ； mysql 中使用使用 IN（）和 OR
ref : 使用非唯一索引扫描或者唯一的前缀扫描，返回匹配某个单独值的记录行
eq_erf : 使用索引是唯一索引，对于每个索引健值，表中只有一条记录匹配
const,system : mysql 对查询某部分进行优化，并转换为一个常量，使用这些类型访问，如将主键置于 where 列表中，mysql 就能将该查询转换为一个常量
null : 执行时不用访问表或者索引，如从一个索引列里选取最小值可以通过单独索引查找完成

- possible_keys
  mysql 使用哪个索引在表中找到记录，查询涉及的字段若存在索引，则该索引将被列出，但不一定被查询使用

- key
  显示 mysql 中实际使用的索引，若没有索引，显示为 null

- key_len
  标示索引中使用的字节数，可通过改列计算查询使用的索引长度,为最大可能长度，并非实际使用长度

- ref
  表示表的连接匹配条件，哪些列或者常量被用于查找索引列上的值

- rows
  估算的找到所需记录所需要的行数

- extra
  包含不适合在其他列中显示但十分重要的额外信息
  a. Using index :使用了覆盖索引（Covering index）mysql 利用索引返回 select 列表中的字段，不必根据索引再次读取数据文件
  包含所有满足查询需要的数据的索引称为覆盖索引。使用覆盖索引,select 列表中只取出需要的列,不可 select\*,如果将所有字段一起做索引
  会导致索引文件过大，查询性能下降
  b. Using where ： mysql 将在存储引擎检索后在进行过滤，许多 wheret 条件里涉及的列，当他读取索引时，就能被存储引擎检验。
  c. Using temporary : 需要使用临时表来存储结果集，常见于排序和分组查询，常见的原因时使用了 DISTINCT,或者使用 order by 和 group by 列
  d. Using filesort ： 无法利用索引完成的排序 文件排序
  e. Using join buffer : 在获取连接条件时 没有使用索引，并且需要连接缓冲区来存储中间结果，如果出现这个值，可能需要添加索引来改进
  f. Impossible where : where 语句会导致没有符合条件的行
  g. Select tables optimized away : 仅通过使用索引，可以仅从聚合函数中返回一行

# 5: 索引

索引是一种特殊的文件，会占用物理存储空间

a. 普通索引

b. 唯一索引

c. 全文索引

d. 单列索引，多列索引

e. 组合索引（最左前缀）

# 6: 修改数据库和表字符集

开发中遇到了不同表数据库字段的字符集编码方式不一致，导致部分索引失效的问题
涉及的表众多，采用批量修改的方式

```sql
SELECT
	 CONCAT('alter table ',a.table_name,' convert to character set utf8mb4 collate utf8mb4_general_ci;')
FROM
	( SELECT table_name FROM information_schema.`TABLES` WHERE TABLE_SCHEMA = 'lng2' ) a;
```

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190510140251.png)

```sql
alter table appointment convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table book convert to character set utf8mb4 collate utf8mb4_general_ci;
alter table muser convert to character set utf8mb4 collate utf8mb4_general_ci;
```

# count() 函数

```sql
SELECT
	CONCAT( DATE_FORMAT( alarm.create_time, '%Y' ), '-', MONTH ( alarm.create_time ) ) AS month,
	count( IF ( alarm.STATUS = 1, TRUE, NULL ) ) AS handled,
	count( IF ( alarm.STATUS = 0, TRUE, NULL ) ) AS unhandled
FROM
	monitor_alarm alarm
	LEFT JOIN station_basic station ON alarm.station_id = station.id
	WHERE alarm.create_time IS NOT NULL
GROUP BY
	MONTH ( alarm.create_time )
ORDER BY
	alarm.create_time DESC;
```

-[function*count*官方文档](https://dev.mysql.com/doc/refman/5.6/en/group-by-functions.html#function_count)

# 7: 移动 mysql 磁盘存储位置

## 停止 mysql

```
systemctl stop mysqld.service
```

## 压缩 mysql 文件

```sql
tar cvpf 新的目录/mysql_backup.tgz mysql/
```

## 删除 mysql 文件

```
rm -rf mysql/
```

## 解压 mysql 文件

```
tar xvpf mysql_backup.tgz
```

## 建立软连接

```
ln -s 新的目录/mysql /var/lib
```

## 软连接详情

```
ls -il
```

## 启动 mysql

```
systemctl start mysqld.service
```

## 动态行转列

```sql
SET @SQL = NULL;
SELECT
	GROUP_CONCAT( DISTINCT CONCAT( 'Max(IF(a.SUBJECT = ''', a.SUBJECT, ''', a.score, 0)) AS ''', a.SUBJECT, '''' ) ) INTO @SQL
FROM
	student_score a
	WHERE a.type=1
	and a.classes='一班';

SET @SQL = CONCAT( 'select  any_value(a.id) as id, any_value(a.school) as school ,any_value(a.time) as time,any_value(a.student_name) as studentName,student_number as studentNumber,a.type,sum(a.score) as sumScore,', @SQL, ' from student_score a WHERE a.type=1 and a.classes="一班" group by a.student_number, a.type ' );
PREPARE stmt
FROM @SQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```
