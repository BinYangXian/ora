PL/SQL Developer Test script 3.0
43
-- 测试循环之for循环

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
0
0
