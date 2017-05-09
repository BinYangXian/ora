PL/SQL Developer Test script 3.0
58
-- 测试数据类型
declare 
  -- 数字类型
  num1 number;
  num2 number :=10;
  
  v_char char(20) :='admin';
  
  v_varchar2 varchar2(20) :='admin';
  
  v_date date:=sysdate;
  
  v_int binary_integer :=20;  -- 只是参与计算  不会存储  一般是作为计数  或是下标
  
  -- 动态类型追踪
  
  empno number;
  
  ename varchar2(30);
  
  -- 动态列类型
  v_ename emp.ename%type;
  
  -- 行变量  可以表示 当前的一条记录
  -- 行类型
  v_row emp%rowtype;
begin
  -- Test statements here
  
  dbms_output.put_line(num1);
  dbms_output.put_line(num2);
  dbms_output.put_line(v_char||'aa'); 
  dbms_output.put_line(v_varchar2||'aa');  
  dbms_output.put_line(v_date);
  dbms_output.put_line(v_int);
  
  -- select into
  -- 返回的有且仅有一条结果
  select e.empno,e.ename into empno,v_ename from emp e where e.empno=7369; 
  
  -- 使用行类型变量
  select e.* into v_row from emp e where e.empno=7369;
  
  dbms_output.put_line(empno||'    '||v_ename); 
  
  dbms_output.put_line(v_row.empno || '    '||v_row.job);   
  
  -- select * from emp;  
  -- 不允许这样写  
  
  
  -- execute immediate  相当于在js中的eval
  execute immediate 'create table test(
        id number(10),
        name varchar2(20)
    )';
  
end;
0
0
