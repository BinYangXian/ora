PL/SQL Developer Test script 3.0
19
-- 测试存储过程调用
declare 
  l_avg number;
  l_success number;
begin
  -- 调用语法  
  -- 没有参数 p_test  ||  p_test()
  p_test;
  
  p_sal(100,l_avg,l_success);
  if l_success<>1 then
     dbms_output.put_line('反正就是错了'); 
  else 
    dbms_output.put_line('test:'||l_avg); 
  end if;
  
  
  
end;
0
0
