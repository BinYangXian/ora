-- 测试创建函数
-- 函数侧重于 返回值
-- 调用方式  是在 slq语句中使用

create or replace function sxt_concat(str1 varchar2,str2 varchar2) return varchar2
is

begin
       -- select * from emp;
       return str1||str2;
end;

-- 测试函数调用

select sxt_concat('1','2') from dual;
