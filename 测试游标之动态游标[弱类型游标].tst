PL/SQL Developer Test script 3.0
32
-- 测试游标之动态游标[弱类型游标]
declare 
  -- 声明类型
  type v_cursor_type is ref cursor;
  -- 声明变量
  v_cursor v_cursor_type;
  
  -- 行变量
  v_row emp%rowtype;
  v_dept_row dept%rowtype;
begin
  -- Test statements here
  
  open v_cursor for select * from emp;
  loop
    fetch v_cursor into v_row;
    exit when v_cursor%notfound;
    
    dbms_output.put_line(v_row.ename);     
  end loop;
  close v_cursor;
  
  open v_cursor for select * from dept;
  loop
    fetch v_cursor into v_dept_row;
    exit when v_cursor%notfound;
    
    dbms_output.put_line(v_dept_row.dname);     
  end loop;
  close v_cursor;
  
end;
0
0
