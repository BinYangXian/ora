PL/SQL Developer Test script 3.0
23
-- 99³Ë·¨±í 
declare 
   s number :=1;
   i number :=1;
   j number :=1;
begin
loop
     loop
        s :=j*i;
          if s>=10 then 
             dbms_output.put(j||'*'||i||'='||s||' ');
          else
             dbms_output.put(j||'*'||i||'= '||s||' ');
          end if;
        j :=j+1;
        exit when j>i ;
      end loop;
      dbms_output.new_line;
      j :=1;
   exit when i>=9; 
   i :=i+1;
end loop;
end;
1
i
0
-5
0
