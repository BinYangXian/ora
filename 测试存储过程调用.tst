PL/SQL Developer Test script 3.0
19
-- ���Դ洢���̵���
declare 
  l_avg number;
  l_success number;
begin
  -- �����﷨  
  -- û�в��� p_test  ||  p_test()
  p_test;
  
  p_sal(100,l_avg,l_success);
  if l_success<>1 then
     dbms_output.put_line('�������Ǵ���'); 
  else 
    dbms_output.put_line('test:'||l_avg); 
  end if;
  
  
  
end;
0
0
