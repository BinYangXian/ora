PL/SQL Developer Test script 3.0
21
-- 测试游标更新数据
-- 默认情况  游标是只读的
declare
    -- 声明游标
    -- 用 for update表示用于更新
    cursor emp_cursor(l_deptno number) is select * from emp_bak e where e.deptno=l_deptno for update;
    
begin

    for emp_row in emp_cursor(20) loop
        -- 更新值到当前的记录
        update emp_bak e set e.sal=30000 where current of emp_cursor;
        
    end loop;
    
    commit;
    -- 异常处理
    exception
        when others then
            rollback;
end;
0
0
