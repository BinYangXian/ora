PL/SQL Developer Test script 3.0
25
-- ���Դ洢���̵���
declare 
  -- Local variables here
  i integer;
  
  v_avg number;
  
  v_success number :=1;
begin
  
  -- ���ô洢�����е��󷽷�����
  -- ����洢����û�в��� ����÷�ʽ ������[()]
  p_test();
  p_test;
  -- ����в���  ����÷�ʽ Ϊ  p_sal(����)
  -- p_sal(20);
  
  p_sal(20,v_avg,v_success);
  if v_success<>1 then
    dbms_output.put_line('����ִ�д���');
  else
    dbms_output.put_line(v_avg); 
  end if; 
  -- dbms_output.put_line(v_avg); 
end;
0
0
