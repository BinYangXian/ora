-- 测试包头
create or replace package my_pack
is 
   --声明变量 或者声明变量和赋值  全局的
   num1 number :=20;
   num2 number ;
   
   -- 函数或者存储过程  只是结构定义  而不会去实现
   
   function func(num1 number,num2 number) return number;
   function func(str1 varchar2,str2 varchar2) return varchar2;
   
   procedure p_test_sal(l_deptno number,l_avg number);
       
end;


-- 创建包体  去实现包头中的代码定义
create or replace package body my_pack
is 
 -- 声明变量 或者声明变量和赋值   私有的
 -- 实现相关的代码声明
 
    function func(num1 number,num2 number) return number
    is
    
    begin
      return num1+num2;
    end;
    
    function func(str1 varchar2,str2 varchar2) return varchar2
    is
    
    begin
      return str1||str2;
    end;
    
    procedure p_test_sal(l_deptno number,l_avg number)
    is
              
    begin
      select avg(e.sal) into l_avg from emp e where e.deptno = l_deptno;
    end;
begin
  dbms_output.put_line('');  
end;

select my_pack.num1 from dual;
