PL/SQL Developer Test script 3.0
30
-- ʹ���쳣
-- ����������
declare 
  -- Local variables here
  i integer;
  
  ex exception;
  
  v_ename emp.ename%type;
begin
  -- insert update delete
  -- ��Ҫ�������  commit rollback;
  
  raise ex;
  
  select e.ename into v_ename from emp e where e.empno=222;
  
  exception
    when no_data_found then 
      dbms_output.put_line('û���ҵ���Ӧ������');    
    when too_many_rows then
      dbms_output.put_line('���ص����ݹ���!');  
      
    when ex then
      dbms_output.put_line('�Զ����쳣');      
    when others then
      dbms_output.put_line('�������Ǵ���');    
      
  
end;
0
0
