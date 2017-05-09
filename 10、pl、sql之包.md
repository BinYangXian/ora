# 包

## 概述
类似于Java中的包，主要解决重名和便于管理。可以模拟方法重载！

## 结构
包分为包头和包体：

- 包头：用于声明公有变量和函数模板以及存储过程模板（interface）
- 包体：主要用于写业务逻辑和代码实现（实现类）

他们之间的结合是通过名字来结合的，包头和包体名称一致则表示一体。

例如：
```sql
-- 创建包头
create or replace packege my_pack
is
    --声明公有数据
    num1 number;
    num2 number :=3000;
    -- 声明函数  只是声明  没有实现
    function my_func1(num1 number,num2 number) return number;
    function my_func2(str1 varchar2,str2 varchar2) return varchar2;
    -- 声明存储过程
    procedure my_procedure(num1 in number,str out varchar2);
end;

-- 调用

--在匿名块中调用：
declare

begin
    -- 调用包头中的数据 就像调用Java类中的静态变量一样
    dbms_output.put_line(my_pack.num2);
end;



```

创建包体
```sql
-- 创建包体   保持包体和包头的名称一致

create or replace package body my_pack
is
    --私有变量
    v_name varchar2(20) :='lisi';
    
    --实现函数
    -- 如果有多个函数 可以在end后面显示的跟上函数名
    -- 表示结束的具体函数
    function my_func1(num1 number,num2 number2)
    is
        num number;
    begin
        num := num1+num2;
        return num;
    end my_func1;
    
    function my_func2(str1 varchar2,str2 varchar2)
    is
        v_msg varchar2(200);
    begin
        v_msg := 'Hello :'||str1||str2;
        return v_msg;
    end my_func2;
    
    --按照实现存储过程的方式实现在包头中的存储过程
begin

    -- 具体的函数代码
    dbms_output.put_line(my_pack.num2);
end;

```


