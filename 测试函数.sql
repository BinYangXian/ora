-- ���Դ�������
-- ���������� ����ֵ
-- ���÷�ʽ  ���� slq�����ʹ��

create or replace function sxt_concat(str1 varchar2,str2 varchar2) return varchar2
is

begin
       -- select * from emp;
       return str1||str2;
end;

-- ���Ժ�������

select sxt_concat('1','2') from dual;
