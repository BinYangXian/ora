PL/SQL Developer Test script 3.0
38
-- 第一个匿名块

/**
declare
   只能进行变量的声明或者变量的声明和赋值
begin
  变量的赋值(不能声明变量)
  业务代码

end;


*/
declare 
  -- 声明变量  语法
  -- [constant] 变量名  类型[长度] [:=值]
  -- 关于赋值
  -- :=  赋值
  -- select into 用于从表中得到值并赋值给变量 
  -- fetch into  用于从游标中的得到值并赋值给变量
  
  num1 number;
  
  num2 number := 20;
begin
  

   num1 :=30;
   -- System.out.println();
   dbms_output.put_line('123123');
   -- 将值放入缓存中  并不会输出  只要遇到有输出换行符的时候才会输出
   dbms_output.put('admin' || '   '||num1);  
   -- 输出换行符
   dbms_output.new_line;  
   
   
  
end;
0
0
