PL/SQL Developer Test script 3.0
30
-- �����α�֮��̬�α�[ǿ�����α�]
-- ��̬�α�  ��Ҫ�ȶ�������  �ٶ������
declare 
   -- ��������
   -- �﷨��  type �������� is ref cursor retrun ������
   type v_cursor_type is ref cursor return emp%rowtype;
   -- ��������
   v_cursor v_cursor_type;
   
   -- �б���
   v_row v_cursor%rowtype;
begin
  -- ���α�
  open v_cursor for select * from emp;
  
  
  loop
       -- �õ�����
       fetch v_cursor into v_row;
       exit when v_cursor%notfound;
       dbms_output.put_line(v_row.ename);  
  end loop;
  
  close v_cursor;
  
  
  
  
  
end;
0
0
