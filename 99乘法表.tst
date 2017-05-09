PL/SQL Developer Test script 3.0
22
-- 99³Ë·¨±í
declare 
 
 v_sum number := 0;

begin
  
   for i in 1..9 loop
     
       for j in 1..i loop
         v_sum := i*j;
         if v_sum<10 then
           dbms_output.put(j ||' x '||i||' =  '||v_sum||'    '); 
         else
           dbms_output.put(j ||' x '||i||' = '||v_sum||'    '); 
         end if;
          
       end loop;
          dbms_output.new_line;      
   end loop;
  
end;
0
0
