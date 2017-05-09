PL/SQL Developer Test script 3.0
25
-- 测试存储过程调用
declare 
  -- Local variables here
  i integer;
  
  v_avg number;
  
  v_success number :=1;
begin
  
  -- 调用存储过程有点象方法调用
  -- 如果存储过程没有参数 则掉用方式 过程名[()]
  p_test();
  p_test;
  -- 如果有参数  则调用方式 为  p_sal(参数)
  -- p_sal(20);
  
  p_sal(20,v_avg,v_success);
  if v_success<>1 then
    dbms_output.put_line('程序执行错误');
  else
    dbms_output.put_line(v_avg); 
  end if; 
  -- dbms_output.put_line(v_avg); 
end;
0
0
