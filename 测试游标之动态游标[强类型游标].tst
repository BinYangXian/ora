PL/SQL Developer Test script 3.0
30
-- 测试游标之动态游标[强类型游标]
-- 动态游标  需要先定义类型  再定义变量
declare 
   -- 声明类型
   -- 语法：  type 类型名称 is ref cursor retrun 行类型
   type v_cursor_type is ref cursor return emp%rowtype;
   -- 声明变量
   v_cursor v_cursor_type;
   
   -- 行变量
   v_row v_cursor%rowtype;
begin
  -- 打开游标
  open v_cursor for select * from emp;
  
  
  loop
       -- 得到数据
       fetch v_cursor into v_row;
       exit when v_cursor%notfound;
       dbms_output.put_line(v_row.ename);  
  end loop;
  
  close v_cursor;
  
  
  
  
  
end;
0
0
