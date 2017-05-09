-- 测试记录日志
-- 创建表
create table emp_bak_log(
       l_id number(10) primary key,
       l_operator varchar2(20) ,
       l_date date,
       l_action varchar2(20)
)

create or replace trigger tr_emp_bak_log after update or delete or insert on emp_bak
begin
  -- 判断操作
  if updating then
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'update');
  elsif deleting then
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'delete');
  else
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'insert');
  end if;
end;


delete from emp_bak e where e.empno=7369;
commit;
