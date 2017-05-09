PL/SQL Developer Test script 3.0
30
-- 测试循环之loop循环

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
0
0
