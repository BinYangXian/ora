-- 触发器记录日志
create table emp_bak_log(
    l_id number(10),  --主键
    l_operator varchar2(20), -- 当前用户
    l_date date, -- 操作的时间
    l_action varchar2(20) --insert update delete
);

create or replace trigger tr_update_emp_bak
after update or insert or delete on emp_bak
begin
  -- updating  inserting deletting
  
  if updating then
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'update');
  elsif deleting then
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'delete');
  else
    insert into emp_bak_log(l_id,l_operator,l_date,l_action) values (seq_emp_bak_log.nextval,user,sysdate,'insert');
end;
