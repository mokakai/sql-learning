### 单表查询name,company相同,age不同的数据

自连接
```
select * from test t1,test t2 WHERE t1.name=t2.name and t1.company =t2.company and t1.age <> t2.age;

输出：

张三	4	腾讯		张三	6	腾讯	
张三	4	腾讯		张三	10	腾讯	
张三	6	腾讯		张三	4	腾讯	
张三	6	腾讯		张三	10	腾讯	
张三	10	腾讯		张三	4	腾讯	
张三	10	腾讯		张三	6	腾讯	

```
可以看到实际就是两张相同表连接，所以会出现重复的数据。

### 查询出 name 和 company 相同，但 age 不同的记录，并且以单行的形式列出。
```
select name,company ,age from test where(name,company) in(select name,company from test group by name,company HAVING COUNT(DISTINCT age)>1)   ;

输出：

张三	腾讯	4
张三	腾讯	6
张三	腾讯	10

```
可以看到输出name,company相同,age不同的单行数据


```
SELECT 
    name, 
    company, 
    GROUP_CONCAT(DISTINCT age ORDER BY age) AS distinct_ages
FROM 
    test
GROUP BY 
    name, 
    company
HAVING 
    COUNT(DISTINCT age) > 1;

输出：

张三	腾讯	4,6,10

```


### 不单行显示，只统计name.company相同,age不同的有多少条数据存在
```
select name,company ,COUNT(*)  from test group by name,company HAVING COUNT(DISTINCT age)>1 ;

输出：

张三	腾讯	3

```
可以使用该查询，判断name,company相同时，是否存在不同age的数据
