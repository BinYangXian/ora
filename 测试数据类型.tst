PL/SQL Developer Test script 3.0
34
-- 测试数据类型
declare 
   v_age number :=20;
   
   v_date date :=sysdate;
   
   v_name varchar2(20) :='zhangsan';
   
   v_email char(20) :='zhangsan';
   
   -- 字段类型的动态追踪
   v_ename emp.ename%type;
   
   -- 行类型
   v_row emp%rowtype;
begin
  -- Test statements here
  
  
  dbms_output.put_line(v_name||'a'); 
  dbms_output.put_line(v_email||'a'); 
  dbms_output.put_line(v_age); 
  dbms_output.put_line(v_date); 
  
  -- select into  返回的结果  有且仅有一条  否则都会报错
  select e.ename into v_ename from emp e where e.empno=7369;
  
  select e.* into v_row from emp e where e.empno=7839;
  
  dbms_output.put_line(v_ename);   
  
  dbms_output.put_line(v_row.ename ||'    '||v_row.job);  
  
end;
0
0
