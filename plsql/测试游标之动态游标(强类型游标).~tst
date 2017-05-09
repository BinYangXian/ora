PL/SQL Developer Test script 3.0
31
-- 测试游标之动态游标(强类型游标)
declare 
  -- 动态游标  要先申明类型  在声明变量
  -- 使用open for 进行初始化数据
  
  
  -- 申明类型
  
  type v_cursor_type is ref cursor return emp%rowtype;
  
  -- 声明变量
  v_cursor v_cursor_type;
  -- 声明行类型
  v_row emp%rowtype;
  
begin
  -- Test statements here
  
  -- 动态游标不能用for循环
  -- 使用open for初始化数据
  open v_cursor for select * from emp;
  
  loop
       fetch v_cursor into v_row;
       exit when v_cursor%notfound;
       dbms_output.put_line(v_row.ename||'   '||v_row.job);  
  end loop;
  
  close v_cursor;
  
end;
0
0
