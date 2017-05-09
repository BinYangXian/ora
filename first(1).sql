-- ����ע��

/*
   ����ע��
*/

-- ������
-- ��Oracle����  ���������治Ҫ������  oracle�в����ִ�Сд
-- ������շ�������  ��Ҫ�� ��_�� ����  userName   user_name

/*

   create table ����(
          ���� ����(����) [default Ĭ��ֵ] [[constraint Լ������] Լ��]
          ....
          [[constraint Լ������]  Լ��]
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

-- �޸�Լ��  û���޸ķ�ʽ
-- ֻ��ɾ���ؽ�
alter table test_student drop constraint stu_cid_fk;
alter table test_student add constraint stu_cid_fk foreign key(cid) references test_class_info(cid) on delete set null;

alter table test_student add constraint stu_cid_fk foreign key(cid) references test_class_info(cid) on delete cascade;

-- ��������ʱ��  
-- ��������
-- Ĭ��ֵ no action ��ɾ������¼��ʱ��  �������޸�����������е�ʱ��  ֻҪ�����Ӽ�¼  �Ͳ��ò���
-- set null ��ɾ������¼��ʱ��  ֻҪ�����Լ�¼  �ͻὫ�Ӽ�¼�� �������Ϊ null
-- cascade ����ɾ��  ��ɾ������¼��ʱ��  ֻҪ�����Ӽ�¼  �ͽ��Ӽ�¼ɾ��

insert into test_class_info(cid,cname) values (1,'JAVA');
insert into test_student(stu_id,stu_name,email,sex,age,cid) values(1,'zhangsan','zhangsan@zhangsan.com',1,110,1);
commit;

update test_student set cid=1 where stu_id=1;

delete from test_class_info where cid=1;

-- �������еı�
-- ֻ�ǿ�����ṹ
-- ���´��Լ��
create table emp_copy as select * from emp where 1=2;

-- ������ṹ������

create table emp_bak as select * from emp where 1=1;


-- �Ա�Ĳ���(CRUD)

-- create  (������  �������)
insert into test_class_info values (1,'JAVA');
insert into test_class_info (cname,cid) values ('HTML',2);

insert into emp_bak(empno,ename) select e.empno,e.ename  from emp e;

-- update �޸�
update test_class_info set cname='JavaScript' where cid=1;

-- ɾ�� delete
-- ɾ����  ɾ����¼  ��ձ�
-- ɾ����¼
delete from emp_bak where empno=7369;
-- ��ձ�  ��Ч������
delete from emp_bak;

-- ��ձ�  Ч�ʽϸ�
truncate table emp_bak;

-- ɾ����  ��Ҫһ��ɾ��Լ��
drop table emp_bak cascade constraints;

insert into emp_bak select * from emp;
commit;

-- ��������ȥ��
delete from emp_bak e1 where rowid <> (select max(rowid) from emp_bak e2 where e2.empno=e1.empno);
commit;

select min(rowid) from emp_bak e where e.empno=7369;

select * from emp_bak;

-- ����ȥ��


-- ���ݷ�ҳ  û��limit  
-- select * from emp_bak limit 1,10;
-- rownum ����ֱ��ʹ�ô��ڵ���
select a.* from (select e1.*,rownum rn from (select e.* from emp_bak e order by e.sal asc) e1 where rownum<=6) a where a.rn>=2;

-- select e.*,rownum from emp_bak e where rownum <=6 order by e.sal asc;




