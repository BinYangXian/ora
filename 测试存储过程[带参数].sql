-- 测试存储过程[带参数]
-- 存储过程的参数分类
-- in  从外部输入参数
-- out  从内部输出到外部
-- in out   既可以输入 也可以输出

--  只要由out修饰的参数  都可以重复赋值  否则  不能再赋值

-- 传入部门号  计算该部门下面的所有员工的平均工资
create or replace procedure p_sal(l_deptno in number,l_avg out number,l_success in out number)
is
  v_avg number;
begin
   
  l_success :=1;
  select avg(e.sal) into v_avg from emp e where e.deptno=l_deptno;
  if v_avg is null then
    l_avg :=0;
    raise no_data_found;  
  end if;
  
  l_avg :=v_avg;
  
  exception 
    when others then
      l_success :=0;
 
end;
