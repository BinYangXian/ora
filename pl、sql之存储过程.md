# 存储过程
存储过程是一个处理业务逻辑的过程或者流程。

## 基本语法
```sql

/* 

语法  :
create [or replace] procedure 过程名[(参数)]
is
-- 变量声明 和初始化
begin

    --逻辑代码处理
    exception
        
end;

*/

-- 最简单的存储过程
create or replace procedure p_sal
is
    v_sal number;
begin

    select e.sal into v_sal from emp e where e.empno=7368;
end;


-- 定义带参数的存储过程 用于计算指定部门的平均工资

create or replace procedure p_sal(
    -- 参数类型  in参数  out参数  in out参数
    -- in参数不能被赋值  相当于常量
    l_deptno in number,
    l_avgsal out number,
    l_success in out number
)
is 
begin
    l_success :=1;
    select avg(e.sal) into l_avgsal from emp e where e.deptno=l_deptno;
    
    if l_avgsal is null then
        raise no_data_found;
    end if;
    
    exception
        when others then
            l_success:=0;
end;

```

存储过程调用：

```sql

declare
    v_avgsal number;
    v_success number;
begin

    p_sal(20,v_avgsal,v_success);
    if v_success<>1 then
        dbms_output.put_line(v_avgsal);
    else
        dbms_output.put_line('执行错误!');
    end if;
    
end;

```