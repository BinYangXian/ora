# 视图

## 基本概念
视图（view）：是数据库中的虚拟表。是复杂sql的简化调用。组成视图的表叫做**基表**,
对视图做修改的时候  不能同时修改多个表中的数据。

## 语法
```sql
/*
-- 语法
create or replace view v$_名字 as select语句 [with read only]
*/

-- 创建一个名字为v$_emp的视图
create or replace view v$_emp as select * from emp_bak;


-- 使用   可以将视图当中普通的表使用
select * from v$_emp;

-- 对视图数据进行修改
update v$_emp e set e.ename=e.ename||'abcd' where e.empno=7369;

```

