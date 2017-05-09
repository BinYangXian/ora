# 异常处理
一般配合事务使用

## 基本格式：
异常代码格式形如：
```sql

declare

    v_ename emp.ename%type;
begin

    -- 会产生多条数据的异常
    select e.ename into v_ename from emp e;
    
    commit;
    exception 
        when 异常代码 then
            处理代码;
            rollback;
end;
```


## 自定义异常
```sql

declare
    -- 定义异常
    ex1 exception;
begin

    -- 抛出异常
    raise ex1;
    
    -- 捕获
    exception
        when ex1 then
            dbms_output.put_line('自定义异常');
end;

```

## 常见异常：
1. **too_many_rows**:  返回多条记录异常
2. **no_data_found**:  未找到数据
3. **others**:  所有异常

