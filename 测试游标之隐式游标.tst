PL/SQL Developer Test script 3.0
12
-- 测试游标之隐式游标
-- 只要是一条sql语句 就是一个隐式游标  游标名称就是sql 
declare 
  
begin
  
   update emp_bak e set e.sal=e.sal*1.2 where e.deptno=20;
   commit;
   dbms_output.put_line(sql%rowcount); 
               
  
end;
0
0
