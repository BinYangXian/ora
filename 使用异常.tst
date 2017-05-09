PL/SQL Developer Test script 3.0
30
-- 使用异常
-- 集合事务处理
declare 
  -- Local variables here
  i integer;
  
  ex exception;
  
  v_ename emp.ename%type;
begin
  -- insert update delete
  -- 需要配合事务  commit rollback;
  
  raise ex;
  
  select e.ename into v_ename from emp e where e.empno=222;
  
  exception
    when no_data_found then 
      dbms_output.put_line('没有找到相应的数据');    
    when too_many_rows then
      dbms_output.put_line('返回的数据过多!');  
      
    when ex then
      dbms_output.put_line('自定义异常');      
    when others then
      dbms_output.put_line('反正就是错啦');    
      
  
end;
0
0
