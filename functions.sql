-- ���Ժ���
-- ��� dual
-- ����
select 'x' from dual;

-- ����  ����  currval  nextval;
select seq_test_student.currval from dual;

select seq_test_student.nextval from dual;

insert into test_student(stu_id,stu_name,email,sex,age) values(seq_test_student.nextval,'zhangsan','zhangsan@zhangsan.com',1,110);
commit;

-- �ַ�������
select trim('    abc    '),ltrim('    abc    '),rtrim('    abc    ') from dual;

select concat(concat('a','b'),'c') ,'a'||'b'||'c' from dual;
-- �����ַ�������
select length('abcd') from dual;

-- ȡ��
select ceil(4.7),floor(4.7) from dual;
-- �õ�ϵͳ����
select sysdate from dual;

select '2',to_number('2'),to_char(20) from dual;
-- 12  24Сʱ
select to_date('2017-02-02 13:12:12','yyyy-mm-dd hh24:mi:ss') from dual;

-- ȡĬ��ֵ
-- nvl(�У�Ĭ��ֵ)  ��ָ�����е�ֵΪnullʱ����Ĭ��ֵ
-- �൱�� if(�� == null) return Ĭ��ֵ;
-- ��oracle�� ���е�ֵ��null���� ��Ϊnull
select e.*, (e.sal+nvl(e.comm,0))*12 from emp e;

select e.*,decode(e.job,'PRESIDENT','ţ��','MANAGER','Сţ��','��ͨ��') from emp e;
