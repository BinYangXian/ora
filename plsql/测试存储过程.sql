
-- 测试存储过程
/*
   存储过程的基本语法
   在工作中  尽量不要使用 or replace
   
   在存储过程中没有显示指定返回值
   
   create [or replace] procedure 过程名[(参数)]
   is
          声明变量  或者  声明变量和赋值
   begin
     
   end;
   
   
   存储过程参数  分类
   
   in  传入参数
   out 传出参数
   in out 传入传出参数
*/


/*
create or replace procedure p_test
is
 v_ename emp.ename%type;
begin
  
 select e.ename into v_ename from emp e where e.empno=7369;
 dbms_output.put_line(v_ename);   
end;
*/

create or replace procedure p_sal(l_deptno in number,l_avg out number,l_success in out number)
is
   -- 如果有out修饰的参数 是可以重复赋值的
   v_avg number;
begin
   -- l_deptno:=30;
   l_success:=1;
   select avg(e.sal) into v_avg from emp e where e.deptno=l_deptno;
   if v_avg is null then
     v_avg:=0;
     raise no_data_found;
   end if;
   
   l_avg :=v_avg;
   -- dbms_output.put_line(v_avg);  
   
   exception 
     when no_data_found then
       l_success:=0;  
end;


