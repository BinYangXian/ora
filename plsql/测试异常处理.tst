PL/SQL Developer Test script 3.0
38
-- �����쳣
declare 
  v_ename emp.ename%type;
  
  ex1 exception;
begin
  
  -- �׳��쳣
 -- raise ex1;

  --select e.ename into v_ename from emp e where e.empno=11111; 
  
  insert into test(id,name) values (1,'lisi');
  
  --raise ex1;
  commit; 

  exception
    -- �������쳣����
    -- too_many_rows
    
    when too_many_rows then 
         dbms_output.put_line('���ص����ݹ���');
         
          when no_data_found then 
         dbms_output.put_line('û���ҵ��������');
         
         when ex1 then
           dbms_output.put_line('ex1'); 
           -- �ع�����
           rollback;     
    
    when others then
      -- �쳣�������
      dbms_output.put_line('��������');   
      
     
end;
0
0
