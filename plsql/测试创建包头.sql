-- 测试创建包头
-- 包头相当于 interface
/*
   语法
   
   create or replace package my_pack
   is
         变量声明
         方法声明
         存储过程声明
   end;

*/

-- 包头
create or replace package my_pack
is
       num1 number:=10;
       -- 声明cursor类型
       type v_cursor_type is ref cursor;
       function func(num1 number,num2 number) return number;
       function func(str1 varchar2,str2 varchar2) return varchar2;
       
       procedure my_procedure(l_deptno in number,l_avg out number);
end;

-- 包体
create or replace package body my_pack
is 

       -- 实现方法和存储过程
       
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
       
       procedure my_procedure(l_deptno in number,l_avg out number)
       is
       
       begin
         select avg(e.sal) into l_avg from emp e where e.deptno=l_deptno;
       end;
begin
  dbms_output.put('');    
end;


select my_pack.func(1,4),my_pack.func('1','4') from dual;


