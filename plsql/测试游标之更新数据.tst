PL/SQL Developer Test script 3.0
25
-- 测试游标之更新数据
declare 
   -- 游标更新数据
   -- 在给定数据的是  就指定意图
  cursor v_cursor is select * from emp_bak for update;
begin
  -- Test statements here
  for v_row in v_cursor loop
    
    if v_row.deptno=10 then
      -- current of v_cursor  表示在v_cursor游标中正在被遍历的元素
      update emp_bak set sal=sal+sal*0.1 where current of v_cursor;
    elsif v_row.deptno=20 then
       update emp_bak set sal=sal+sal*0.2 where current of v_cursor;
    elsif v_row.deptno=30 then
       update emp_bak set sal=sal+sal*0.3 where current of v_cursor;
    end if;
    
    
  end loop;
  
  
  -- 提交事务  如果放入到循环中会有问题
  commit;
end;
0
0
