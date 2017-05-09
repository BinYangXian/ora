PL/SQL Developer Test script 3.0
43
-- 测试显示游标之静态游标
declare 
   cursor v_cursor is select * from emp_bak;
   
   rows v_cursor%rowtype;
begin
  -- Test statements here
  -- for循环
  -- 如果是静态游标  并且用for遍历  不需要在打开有关闭游标  for会帮我们做
  for v_row in v_cursor loop
      dbms_output.put_line(v_row.ename);     
  end loop;
  
  
  -- 游标的使用步骤
  -- 声明游标
  -- 打开游标 
  -- 使用游标
  -- 关闭游标
  
  dbms_output.put_line('----------');          
  
  -- 打开
  open v_cursor;
  fetch v_cursor into rows;
  while v_cursor%found loop
    
    dbms_output.put_line(rows.ename);    
    fetch v_cursor into rows;    
  end loop;
  
  -- 关闭游标
  close v_cursor;
  
  open v_cursor;
  loop
       fetch v_cursor into rows;
       exit when v_cursor%notfound;
       dbms_output.put_line(rows.ename||'   '||rows.job);     
       
  end loop;
  close v_cursor;
end;
0
0
