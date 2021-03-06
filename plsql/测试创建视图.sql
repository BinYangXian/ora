
-- select * from (select * from emp e left join dept d on e.deptno=d.deptno) a; 

/*
   创建视图的语法
   create [or replace] view v$视图名 as 查询语句 [with read only]
   
   视图 叫虚拟表
   组成视图的表  叫基表
*/

create or replace view v$emp_dept as select e.*,d.dname as dname,d.loc as loc from emp e left join dept d on e.deptno=d.deptno;

select * from v$emp_dept;

-- 使用视图更新数据
-- 在修改的时候  要保证在修改的字段是在一张表里面
