-- 测试创建函数
/*
   函数的结构
   
   create [or replace] function 函数名 (参数..) return 返回值类型
   is
   begin
     
   end;
   
   函数调用  必须在sql语句中调用函数
   
   
*/

create or replace function sxt_concat(str1 varchar2,str2 varchar2) return varchar2
is

begin
  
    return str1||str2;
end;

-- 调用函数

select sxt_concat('a','b') from dual;
