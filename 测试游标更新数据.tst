PL/SQL Developer Test script 3.0
21
-- �����α��������
-- Ĭ�����  �α���ֻ����
declare
    -- �����α�
    -- �� for update��ʾ���ڸ���
    cursor emp_cursor(l_deptno number) is select * from emp_bak e where e.deptno=l_deptno for update;
    
begin

    for emp_row in emp_cursor(20) loop
        -- ����ֵ����ǰ�ļ�¼
        update emp_bak e set e.sal=30000 where current of emp_cursor;
        
    end loop;
    
    commit;
    -- �쳣����
    exception
        when others then
            rollback;
end;
0
0
