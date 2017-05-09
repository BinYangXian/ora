-- ���Դ�����ͷ
-- ��ͷ�൱�� interface
/*
   �﷨
   
   create or replace package my_pack
   is
         ��������
         ��������
         �洢��������
   end;

*/

-- ��ͷ
create or replace package my_pack
is
       num1 number:=10;
       -- ����cursor����
       type v_cursor_type is ref cursor;
       function func(num1 number,num2 number) return number;
       function func(str1 varchar2,str2 varchar2) return varchar2;
       
       procedure my_procedure(l_deptno in number,l_avg out number);
end;

-- ����
create or replace package body my_pack
is 

       -- ʵ�ַ����ʹ洢����
       
       function func(num1 number,num2 number) return number
       is
       
       begin
         return num1+num2;
       end;
       
       function func(str1 varchar2,str2 varchar2) return varchar2
       is
       
       begin
         return str1||str2;
       end;
       
       procedure my_procedure(l_deptno in number,l_avg out number)
       is
       
       begin
         select avg(e.sal) into l_avg from emp e where e.deptno=l_deptno;
       end;
begin
  dbms_output.put('');    
end;


select my_pack.func(1,4),my_pack.func('1','4') from dual;


