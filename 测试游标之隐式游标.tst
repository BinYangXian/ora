PL/SQL Developer Test script 3.0
12
-- �����α�֮��ʽ�α�
-- ֻҪ��һ��sql��� ����һ����ʽ�α�  �α����ƾ���sql 
declare 
  
begin
  
   update emp_bak e set e.sal=e.sal*1.2 where e.deptno=20;
   commit;
   dbms_output.put_line(sql%rowcount); 
               
  
end;
0
0
