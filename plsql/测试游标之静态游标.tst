PL/SQL Developer Test script 3.0
46
-- �����α�֮��̬�α�
declare 
  -- �����α�
  -- �﷨  cursor ���� is select ...
  cursor v_cursor is select * from emp;
  
  -- v_r v_cursor%rowtype;
  v_r emp%rowtype;
begin
  -- ���ھ�̬�α�  ʹ�� forѭ������򵥵�
  -- ����Ҫ��ʾ�򿪺͹ر��α�  Ҳ����Ҫ�����м����  forѭ�����������
  
  for v_row in v_cursor loop
    dbms_output.put_line(v_row.empno ||'   '||v_row.ename);  
  end loop;
  
  
  dbms_output.put_line('-----------');
  
  -- ���α�
  open v_cursor;
  
  loop
    
       fetch v_cursor into v_r;
       -- ���Ҫʹ���α��found��notfound����  ��һ��Ҫ��fetchһ��
       exit when v_cursor%notfound;
       dbms_output.put_line(v_r.empno||'   '||v_r.job);    
       
  
  end loop;
  -- �ر��α�
  close v_cursor;
  
  dbms_output.put_line('-----------');
  
  open v_cursor;
  fetch v_cursor into v_r;
  while v_cursor%found loop
    dbms_output.put_line(v_r.ename||'   '||v_r.job); 
    fetch v_cursor into v_r;             
  end loop;
  
  close v_cursor;
            
end;
0
0
