PL/SQL Developer Test script 3.0
21
-- 99³Ë·¨±í
declare 
  k number;
begin
  -- Test statements here
  
  for i in 1..9 loop
      for j in 1..i loop
        k := i*j;
        if k<10 then
          dbms_output.put(j ||' x ' ||i ||' =  '||i*j||'  '); 
        else
          dbms_output.put(j ||' x ' ||i ||' = '||i*j||'  ');
        end if;
         
      end loop;
  
      dbms_output.new_line; 
  end loop;
  
end;
0
0
