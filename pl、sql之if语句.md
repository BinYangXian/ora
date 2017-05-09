# PLSQL中的IF语句

### 1、基本语法：

语法和**Java**中的语法及其相似，只是在**Java**中的 *else if* 要改变为 *elsif* 并且在该if语句块结束的时候需要加上 **end if;**。

### 2、代码例子:

```sql
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
    elsif v_sum<6 and v_sum<=12 then
        dbms_output.put_line('手气一般');
    else
        dbms_output.put_line('手气很差');
    end if;

end;
```