PL/SQL Developer Test script 3.0
13
-- ���԰�ͷ�Ͱ������
declare 
  -- Local variables here
  v_avg number;
begin
  dbms_output.put_line(my_pack.num1); 
  my_pack.num2 :=30;
  dbms_output.put_line(my_pack.num2); 

  my_pack.p_test_sal(20,v_avg);
  dbms_output.put_line(v_avg); 
  
end;
0
0
