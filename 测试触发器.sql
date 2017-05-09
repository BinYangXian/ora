--测试触发器
/*

创建触发器的基本语法
  create [or replace] trigger tr_名字 
  before|after update or delete or insert on 表名 [for each row]
  begin
      -- 增、删、改语句   自动提交事务
  end;
  
  :new
  :old
*/

update dept d1 set d1.deptno=99 where d1.deptno=10;

create or replace trigger tr_update_dept before update on dept for each row

begin
  update emp e set e.deptno=:new.deptno where e.deptno=:old.deptno;
end;
