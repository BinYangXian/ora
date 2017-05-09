-- 测试视图
-- 是虚拟的表  是有多个已经存在的数据表结合而来

-- 视图更新数据
-- 更新的数据  只能在 一张表里面  同一次更新  字段不能跨表
-- 
create or replace view v$Emp_Dept as select e.*,d1.dname,d1.loc from emp e left join dept d1 on e.deptno=d1.deptno


-- 调用视图
select a.empno,a.ename,a.dname from v$emp_dept  a

update v$emp_dept e set e.ename='KING' where e.empno=7839;

-- 修改不能跨表
-- update v$emp_dept e set e.ename='WARD',e.dname='aaa' where e.empno=7521;
