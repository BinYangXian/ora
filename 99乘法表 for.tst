PL/SQL Developer Test script 3.0
17
-- 99³Ë·¨±í 
declare 
   s number :=1;
begin
  for i in 1..9 loop
    for j in 1..i loop
      s :=j*i;
      if s>=10 then 
        dbms_output.put(j||'*'||i||'='||s||' ');
       else
        dbms_output.put(j||'*'||i||'= '||s||' ');
       end if;
    end loop;
    dbms_output.new_line;
   end loop;
 
end;
