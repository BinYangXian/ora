PL/SQL Developer Test script 3.0
32
-- �����α�֮��̬�α�[�������α�]
declare 
  -- ��������
  type v_cursor_type is ref cursor;
  -- ��������
  v_cursor v_cursor_type;
  
  -- �б���
  v_row emp%rowtype;
  v_dept_row dept%rowtype;
begin
  -- Test statements here
  
  open v_cursor for select * from emp;
  loop
    fetch v_cursor into v_row;
    exit when v_cursor%notfound;
    
    dbms_output.put_line(v_row.ename);     
  end loop;
  close v_cursor;
  
  open v_cursor for select * from dept;
  loop
    fetch v_cursor into v_dept_row;
    exit when v_cursor%notfound;
    
    dbms_output.put_line(v_dept_row.dname);     
  end loop;
  close v_cursor;
  
end;
0
0
