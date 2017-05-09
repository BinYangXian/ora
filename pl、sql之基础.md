# PLSQL
PLSQL是一种**脚本**语言，主要用于在数据库中写程序，效率高，安全性也相对较高，但是可读性较差

# PL/SQL基础语法


## 匿名块
匿名块是函数、存储过程、包、触发器的基本单元。
### 基本格式：
```sql
declare
    -- 只能声明和初始化变量
    ...
begin
    -- 代码
    ...
    exception 
end;
```

### 变量声明及赋值：  
变量只能声明在**declare**和**begin**中，形如：
```sql
declare
    -- 变量声明
    
    -- 语法  变量名 [constant] 数据类型[(长度)] [:=初始值];
    -- := 为赋值符号
    v_num number := 20;
    -- 字符串必须用单引号包裹
    v_name varchar2(20) := 'zhangsan';
    
    -- 如果是先声明  后赋值的话  赋值操作一定要写在  begin 和 end 之间
    v_age number;
    
    v_sum number;
begin
    -- 赋值语句 
    --      1、:= 
    --      2、select into (有且仅有一条结果)
    --      3、fetch into 
    v_age := 20;
    
    select e.ename into v_name from emp e where e.empno=7369;
    
    select sum(e.sal) into v_sum from emp e;
    
end;
```

### 数据类型：
常用的数据类型有一下几种：
1. **数字类型（number）:**    
    >数字类型  默认可以不用写长度 ```v_num number(2):=10;```
2. **变长字符串（varchar2）:**
    >变长字符串 在声明的时候  一定要写长度 ```v_name varchar2(20):='zhangsan'```
3. **定长字符串（char）:**
    >定长字符串 声明的时候  需要指定长度 ```v_id char(18) :='123123199903027658'```
4. **日期类型（date）:**
    >日期类型 ```v_date date:=sysdate```
5. **整数类型（binary_integer）:**
    >整数类型 和Java中的Integer取值一样  ```v_integer binary_integer :=200```

其他数据类型：
1. **动态类型追踪：**
    1. **动态追踪表的字段类型**  
        动态查询表中已经存在的字段类型 ```v_ename emp.ename%type```  

    2. **动态追踪表中的行类型**  
        表示一行的数据类型集合 ```v_emp_row emp%rowtype```
2. **table类型：**  
    类似于Java中的数组，分为零散型和集中型。在使用的时候  要先定义类型，然后
再定义变量。定义类型语法如下：  
    ```sql
    declare
        -- 声明类型 (零散型)
        type my_table is table of varchar2(20) index by binary_integer;
        -- 声明变量
        v_my_table my_table;
        
        -- 集中型
        type my_table1 is table of varchar2(20);
        -- 声明变量 
        v_my_table1 my_table1;
    
    begin
        -- 零散型赋值
        -- 零散型  下标比较随意 只要满足数据类型即可 
        -- 单个元素赋值  数据长度无限制
        v_my_table(0) := 'zhangsan';
        v_my_table(1) := 'lisi';
        v_my_table(-1) := 'admin';
        
        dbms_output.put_line(v_my_table(0));
        
        -- 集中型赋值使用 (下标起始值为1)
        v_my_table1 := my_table1('zhangsan','lisi','admin');
        
        dbms_output.put_line(v_my_table1(1));
        
        -- 如果要进行扩展数据  必须将原有的变量进行扩展
        v_my_table1.extend;
        v_my_table1(4) := 'wangwu';
        
         dbms_output.put_line(v_my_table1(4));
    end;
    ```
    
3. **record类型**  
    record类似结构体。先定义类型，在定义变量。使用方式：
    ```sql
    declare
    
        -- 声明record变量  类似结构体
        
        type my_record is record(
            v_ename varchar2(20) not null := 'zhangsan',
            v_sal number,
            v_date date
        );
        
        -- 声明变量
        v_my_record my_record;
    begin
        -- 赋值
        v_my_record.v_ename := 'lisi';
        dbms_output.put_line(v_my_record.v_ename);
        -- 查询赋值
        select e.ename,e.sal,e.hiredate into v_my_record from emp e where e.empno=7499;
        
        dbms_output.put_line(v_my_record.v_ename||'   '||v_my_record.v_date);
    end;
    
    ```
    
### 使用DML、DDL、DCL：
DML（Data Manipulation Language）数据操纵语句、DDL（Data Definition Language）数据定义语句、DCL（Data Control Language）数据库控制语句。  

```sql

declare

begin

    -- 在匿名块里面使用 DML语句   但是对select没有意义
    -- 错误
    -- select * from emp e;   
    
    update emp_bak e set e.sal=10000 where e.deptno=20; 
    -- 提交
    commit;
    
    -- 要创建表  就必须要用 execute immediate 'dml或ddl语句' 相当于js中的eval
    execute immediate 'create table test(
        id number,
        name varchar2(20)
    )';

end;
```