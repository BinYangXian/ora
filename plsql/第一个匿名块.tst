PL/SQL Developer Test script 3.0
40
-- 第一个匿名块
-- 单行注释
/*
   多行注释
   
   基本结构
   
   declare
      声明变量   或者   声明变量和赋值
   begin
      变量的赋值
      代码的业务逻辑
   end;
   
*/
declare 
  -- Local variables here
  num number;
  age number := 20;
begin
  -- Test statements here
  -- dbms_output 相当于System.out
  
  num:=200;
  
  /*
     赋值语句
     :=
     select into
     fetch into   游标（类似于集合）
  
  */
  
  
  
  dbms_output.put_line(age);
  
  dbms_output.put('admin'); -- 将值放入缓存中  只有当调用了有换行符输出的语句的时候 才会输出
  dbms_output.new_line;  -- 打印换行符
end;
0
0
