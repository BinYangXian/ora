-- ���Դ洢����

/*
   create [or replace] procedure ����
   is
          ������� ���߶�������͸�ֵ
   begin
          ������ֵ
          ҵ���߼�
   end;
   
   
   �洢����ʹ��   ������sql�����ʹ��  ֻ���ڴ洢���̻����������е���
*/

create or replace procedure p_test
is
  v_age number :=20;
  v_empno number;
  v_ename emp.ename%type;
begin
  
  select e.ename,e.empno into v_ename,v_empno from emp e where e.empno=7369;
  dbms_output.put_line(v_empno||'  '||v_ename); 
  
  -- select * from emp;  

end;
