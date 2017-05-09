-- 单行注释

/*
   多行注释
*/

-- 创建表
-- 在Oracle里面  表名和里面不要有引号  oracle中不区分大小写
-- 如果有驼峰命名的  需要用 “_” 隔开  userName   user_name

/*

   create table 表名(
          列名 类型(长度) [default 默认值] [[constraint 约束名称] 约束]
          ....
          [[constraint 约束名称]  约束]
   );

*/

/*
create table test_test(
       tid number(10) primary key,
       tname varchar2(200) not null 
);

select "tname" from test_test;

*/

create table test_student(
       stu_id number(10) constraint stu_id_pk primary key,
       stu_name varchar2(100) not null,
       email varchar2(100),
       stu_no number(10) unique,
       sex number(1),
       age number(3),
       cid number(10),
       constraint sex_ck check (sex=0 or sex=1) ,
       constraint age_ck check (age>=0 and age<120),
       constraint stu_cid_fk foreign key(cid) references test_class_info(cid)
);

create table test_class_info(
       cid number(10) primary key,
       cname varchar2(100) not null
)

-- 修改约束  没有修改方式
-- 只有删除重建
alter table test_student drop constraint stu_cid_fk;
alter table test_student add constraint stu_cid_fk foreign key(cid) references test_class_info(cid) on delete set null;

alter table test_student add constraint stu_cid_fk foreign key(cid) references test_class_info(cid) on delete cascade;

-- 针对外键的时候  
-- 级联操作
-- 默认值 no action 在删除父记录的时候  或者有修改外键关联的列的时候  只要发现子记录  就不让操作
-- set null 在删除父记录的时候  只要发现自记录  就会将子记录的 外键设置为 null
-- cascade 级联删除  在删除父记录的时候  只要发现子记录  就将子记录删除

insert into test_class_info(cid,cname) values (1,'JAVA');
insert into test_student(stu_id,stu_name,email,sex,age,cid) values(1,'zhangsan','zhangsan@zhangsan.com',1,110,1);
commit;

update test_student set cid=1 where stu_id=1;

delete from test_class_info where cid=1;

-- 拷贝已有的表
-- 只是拷贝表结构
-- 不会拷贝约束
create table emp_copy as select * from emp where 1=2;

-- 拷贝表结构和数据

create table emp_bak as select * from emp where 1=1;


-- 对表的操作(CRUD)

-- create  (创建表  添加数据)
insert into test_class_info values (1,'JAVA');
insert into test_class_info (cname,cid) values ('HTML',2);

insert into emp_bak(empno,ename) select e.empno,e.ename  from emp e;

-- update 修改
update test_class_info set cname='JavaScript' where cid=1;

-- 删除 delete
-- 删除表  删除记录  清空表
-- 删除记录
delete from emp_bak where empno=7369;
-- 清空表  有效率问题
delete from emp_bak;

-- 清空表  效率较高
truncate table emp_bak;

-- 删除表  需要一并删除约束
drop table emp_bak cascade constraints;

insert into emp_bak select * from emp;
commit;

-- 经典数据去重
delete from emp_bak e1 where rowid <> (select max(rowid) from emp_bak e2 where e2.empno=e1.empno);
commit;

select min(rowid) from emp_bak e where e.empno=7369;

select * from emp_bak;

-- 数据去重


-- 数据分页  没有limit  
-- select * from emp_bak limit 1,10;
-- rownum 不能直接使用大于等于
select a.* from (select e1.*,rownum rn from (select e.* from emp_bak e order by e.sal asc) e1 where rownum<=6) a where a.rn>=2;

-- select e.*,rownum from emp_bak e where rownum <=6 order by e.sal asc;




