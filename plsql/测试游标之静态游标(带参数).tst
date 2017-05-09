PL/SQL Developer Test script 3.0
24
-- 测试游标之静态游标(带参数)
declare 

   /*
      cursor v_cursor(l_deptno number){
             return select * from emp e where e.deptno=l_deptno;
      }
   */
   cursor v_cursor(l_deptno number) is select * from emp e where e.deptno=l_deptno;
   
   v_row emp%rowtype;
begin
  -- Test statements here
  for v_r in v_cursor(10) loop
    dbms_output.put_line(v_r.ename||'    '||v_r.deptno);       
  end loop;
  
  open v_cursor(20);
  loop
    fetch v_cursor into v_row;
    exit when v_cursor%notfound;
    dbms_output.put_line(v_row.job);            
  end loop;
end;
0
0
