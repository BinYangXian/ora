# 循环语句
## for循环:
```sql
declare

    v_sum number := 0;

begin
    /*
        语法
        for 常量 in 集合 loop   -- (其中  常量可以动态匹配集合里面的类型)
        
        end loop;
    */
    
    -- 计算1到100的和
    
    for i in 1..100 loop
        v_sum := v_sum + i;
    end loop;
    
    dbms_output.put_line(v_sum);
    
    -- 计算1到100之间的奇数的和
    
    v_sum :=0;
    
    for i in 1..100 loop
    
        if mod(i,2)=0 then
            v_sum := v_sum+i;
        end if;
    end loop;
    
    dbms_output.put_line(v_sum);
    
    -- 倒序遍历
    
    dbms_output.put_line('-----------------');
    for i in reverse 1..10 loop
        dbms_output.put_line(i);
    end loop;

end;
```

## loop循环:
```sql
declare

    v_sum number:=0;
    v_i number :=1;

begin

    /*
    
        loop循环
        
        loop
            循环体;
            exit when 循环退出条件;
            循环体;
        end loop;
    */
    
    -- 计算1到100的累加和
    
    loop
        v_sum := v_sum+v_i;
        exit when v_i>=100;
        v_i :=v_i+1;
    end loop;
    dbms_output.put_line(v_sum);

end;
```

## while循环:
```sql
declare

    v_sum number := 0;
    v_i number := 1;
begin

    /*
        while 循环
        
        while 条件 loop
            循环体
        end loop;
    */
    
    -- 计算1到100的累加和
    
    while v_i<=100 loop
        v_sum := v_sum+v_i;
        v_i :=v_i+1;
    end loop;
    
    dbms_output.put_line(v_sum);

end;
```