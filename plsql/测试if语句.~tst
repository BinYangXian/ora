PL/SQL Developer Test script 3.0
22
-- 测试if语句
declare
    -- 声明变量
    -- dbms_random.value 产生随机数
    -- floor 取整
    v_number1 number := floor(dbms_random.value*6)+1;
    v_number2 number := floor(dbms_random.value*6)+1;
    v_number3 number := floor(dbms_random.value*6)+1;
    v_sum number := 0;
begin
    -- 计算和
    v_sum := v_number1+v_number2+v_number3;
    -- 判断
    if v_sum>12 then
        dbms_output.put_line('手气不错');
    elsif v_sum>6 and v_sum<=12 then
        dbms_output.put_line('手气一般');
    else
        dbms_output.put_line('手气很差');
    end if;

end;
0
0
