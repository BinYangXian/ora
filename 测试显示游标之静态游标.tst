PL/SQL Developer Test script 3.0
43
-- ������ʾ�α�֮��̬�α�
declare 
   cursor v_cursor is select * from emp_bak;
   
   rows v_cursor%rowtype;
begin
  -- Test statements here
  -- forѭ��
  -- ����Ǿ�̬�α�  ������for����  ����Ҫ�ڴ��йر��α�  for���������
  for v_row in v_cursor loop
      dbms_output.put_line(v_row.ename);     
  end loop;
  
  
  -- �α��ʹ�ò���
  -- �����α�
  -- ���α� 
  -- ʹ���α�
  -- �ر��α�
  
  dbms_output.put_line('----------');          
  
  -- ��
  open v_cursor;
  fetch v_cursor into rows;
  while v_cursor%found loop
    
    dbms_output.put_line(rows.ename);    
    fetch v_cursor into rows;    
  end loop;
  
  -- �ر��α�
  close v_cursor;
  
  open v_cursor;
  loop
       fetch v_cursor into rows;
       exit when v_cursor%notfound;
       dbms_output.put_line(rows.ename||'   '||rows.job);     
       
  end loop;
  close v_cursor;
end;
0
0
