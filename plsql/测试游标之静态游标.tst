PL/SQL Developer Test script 3.0
46
-- 测试游标之静态游标
declare 
  -- 声明游标
  -- 语法  cursor 名称 is select ...
  cursor v_cursor is select * from emp;
  
  -- v_r v_cursor%rowtype;
  v_r emp%rowtype;
begin
  -- 对于静态游标  使用 for循环是最简单的
  -- 不需要显示打开和关闭游标  也不需要声明中间变量  for循环会帮我们做
  
  for v_row in v_cursor loop
    dbms_output.put_line(v_row.empno ||'   '||v_row.ename);  
  end loop;
  
  
  dbms_output.put_line('-----------');
  
  -- 打开游标
  open v_cursor;
  
  loop
    
       fetch v_cursor into v_r;
       -- 如果要使用游标的found和notfound属性  则一定要先fetch一下
       exit when v_cursor%notfound;
       dbms_output.put_line(v_r.empno||'   '||v_r.job);    
       
  
  end loop;
  -- 关闭游标
  close v_cursor;
  
  dbms_output.put_line('-----------');
  
  open v_cursor;
  fetch v_cursor into v_r;
  while v_cursor%found loop
    dbms_output.put_line(v_r.ename||'   '||v_r.job); 
    fetch v_cursor into v_r;             
  end loop;
  
  close v_cursor;
            
end;
0
0
