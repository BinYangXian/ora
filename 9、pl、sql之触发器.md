# 触发器

## 概述  

数据完整性规则:

- 实体要有主键
- 不引用不存在的实体
- 自定义完整性

触发器：不需要再外面调用 ，之在发生事件的时候自动由数据库调用。换句话说，就是触发器是自动运行的。它是自动运行的，会自动维护数据完整性，记录日志。


## 语法
```sql

/*
    -- 创建触发器的基本语法
    create or replace trigger tr_名字 
    before|after update or delete or insert on 表名 [for each row]
    begin
        -- 增、删、改语句   自动提交事务
    end;
*/

-- 维护数据完整性实例

create or replace trigger tr_emp_update
    before update  on dept_bak for each row
begin
    update emp_bak e set e.deptno=:new.deptno where e.deptno=:old.deptno;
end;

/*
    :old 是修改之前的那一行记录
    :new 是修改之后的记录
    
    after  :new 不能改值 :old不能改值
    before :new 可以改值 :old不能改值
*/

```

## 触发器记录日志
```sql

-- 创建一个序列 SEQ_EMP_BAK_LOG

-- 创建一张表
create table emp_bak_log(
    l_id number,
    l_operator varchar2(20),
    l_date date,
    l_action varchar2(20)
);

-- 创建一个触发器
create or replace trigger tr_emp_bak_log before update or delete or insert on emp_bak
begin
    -- 判断 操作状态
    if updating then
        insert into emp_bak_log (l_id,l_operator,l_date,l_action) values (SEQ_EMP_BAK_LOG.nextval,user,sysdate,'update');
    elsif deleting then
        insert into emp_bak_log (l_id,l_operator,l_date,l_action) values (SEQ_EMP_BAK_LOG.nextval,user,sysdate,'update');
    else
        insert into emp_bak_log (l_id,l_operator,l_date,l_action) values (SEQ_EMP_BAK_LOG.nextval,user,sysdate,'update');
    end if;
end


```