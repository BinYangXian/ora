-- ������ͼ
-- ������ı�  ���ж���Ѿ����ڵ����ݱ��϶���

-- ��ͼ��������
-- ���µ�����  ֻ���� һ�ű�����  ͬһ�θ���  �ֶβ��ܿ��
-- 
create or replace view v$Emp_Dept as select e.*,d1.dname,d1.loc from emp e left join dept d1 on e.deptno=d1.deptno


-- ������ͼ
select a.empno,a.ename,a.dname from v$emp_dept  a

update v$emp_dept e set e.ename='KING' where e.empno=7839;

-- �޸Ĳ��ܿ��
-- update v$emp_dept e set e.ename='WARD',e.dname='aaa' where e.empno=7521;
