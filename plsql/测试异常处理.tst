PL/SQL Developer Test script 3.0
38
-- 测试异常
declare 
  v_ename emp.ename%type;
  
  ex1 exception;
begin
  
  -- 抛出异常
 -- raise ex1;

  --select e.ename into v_ename from emp e where e.empno=11111; 
  
  insert into test(id,name) values (1,'lisi');
  
  --raise ex1;
  commit; 

  exception
    -- 常见的异常代码
    -- too_many_rows
    
    when too_many_rows then 
         dbms_output.put_line('返回的数据过多');
         
          when no_data_found then 
         dbms_output.put_line('没有找到相关数据');
         
         when ex1 then
           dbms_output.put_line('ex1'); 
           -- 回滚数据
           rollback;     
    
    when others then
      -- 异常处理代码
      dbms_output.put_line('反正错了');   
      
     
end;
0
0
