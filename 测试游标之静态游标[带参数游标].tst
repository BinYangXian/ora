PL/SQL Developer Test script 3.0
20
-- 测试游标之静态游标[带参数游标]
declare 
  
   cursor v_cursor(l_deptno number) is select e.* from emp e where e.deptno=l_deptno;
   
   v_row v_cursor%rowtype;
begin
  -- Test statements here
  -- 在open的时候  给定参数
  open v_cursor(20);
  
  loop
       fetch v_cursor into v_row;
       exit when v_cursor%notfound;
       dbms_output.put_line(v_row.ename ||'   '||v_row.deptno);    
  end loop;
  
  close v_cursor;
  
end;
0
0
