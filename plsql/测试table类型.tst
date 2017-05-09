PL/SQL Developer Test script 3.0
54
-- 测试table类型
/*
   必须要先定义类型 再定义变量  然后使用

   table 类型
   
     零散型
         定义类型的语法
         type  类型名 is table of varchar2(20) index by binary_integer;
     
     集中型
         type  类型名 is table of varchar2(20);
*/
declare 
  -- 定义类型
  type v_table_type is table of varchar2(20) index by binary_integer;
  
  -- 定义集中型的类型
  type v_table_type1 is table of varchar2(20);
  
  -- 声明变量
  v_table v_table_type;
  
  -- 声明集中型变量
  v_table1 v_table_type1;
begin
  -- Test statements here
  
  -- 对应零散型的 table 下标是没有限制的
  v_table(1) :='lisi';
  v_table(2) :='zhangsan';
  
  v_table(-1) :='aaaa';
  
  -- 在使用的时候  一定确保该数据在v_table中有值  否则会报错
  dbms_output.put_line(v_table(1) || '   '||v_table(2) || '   '||v_table(-1));  
  
  
  -- 初始化值
  -- 下标从1开始
  v_table1 := v_table_type1('zhangsan','admin','lisi');
  
  
  -- 集中型不可以扩展赋值
  -- 如果要想扩展赋值  必须要显示调用
  v_table1.extend;
  v_table1(4) :='aaaaa';
  
  
  
  
  dbms_output.put_line(v_table1(1)|| '     '||v_table1(4));       
  
end;
0
0
