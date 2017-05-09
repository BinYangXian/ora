-- 测试存储过程

/*
   create [or replace] procedure 名称
   is
          定义变量 或者定义变量和赋值
   begin
          变量赋值
          业务逻辑
   end;
   
   
   存储过程使用   不能在sql语句中使用  只能在存储过程或者匿名块中调用
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
