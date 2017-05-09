-- 触发器
/*
   类似于js中的  事件处理函数
   
   :new
   :old
*/

-- delete from dept where deptno=10;

update dept set deptno=99 where deptno=10;

-- update emp e set e.deptno=10 where e.deptno is null;

create or replace trigger tr_update_deptno
before update on dept for each row
begin
  
       -- 事务自动提交
       update emp e set e.deptno=:new.deptno where e.deptno=:old.deptno;

end;

