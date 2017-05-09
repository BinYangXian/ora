PL/SQL Developer Test script 3.0
13
-- Created on 2017/2/17 by ADMINISTRATOR 
declare 
  -- Local variables here
  i integer;
  
  v_avg number;
begin
  -- Test statements here
  dbms_output.put_line(my_pack.num1); 
  my_pack.my_procedure(20,v_avg);
  dbms_output.put_line(v_avg); 
  
end;
0
0
