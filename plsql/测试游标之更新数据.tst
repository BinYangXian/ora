PL/SQL Developer Test script 3.0
25
-- �����α�֮��������
declare 
   -- �α��������
   -- �ڸ������ݵ���  ��ָ����ͼ
  cursor v_cursor is select * from emp_bak for update;
begin
  -- Test statements here
  for v_row in v_cursor loop
    
    if v_row.deptno=10 then
      -- current of v_cursor  ��ʾ��v_cursor�α������ڱ�������Ԫ��
      update emp_bak set sal=sal+sal*0.1 where current of v_cursor;
    elsif v_row.deptno=20 then
       update emp_bak set sal=sal+sal*0.2 where current of v_cursor;
    elsif v_row.deptno=30 then
       update emp_bak set sal=sal+sal*0.3 where current of v_cursor;
    end if;
    
    
  end loop;
  
  
  -- �ύ����  ������뵽ѭ���л�������
  commit;
end;
0
0
