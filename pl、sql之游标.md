# 游标

## 概述：
游标是plsql中最重要的集合类型、类似Java中的iterator

## 游标分类：
```
graph TD
A[游标]-->B[隐式游标]
A-->C[显示游标]
C-->D[静态游标]
C-->E[动态游标]
E-->F[弱类型游标]
E-->G[强类型游标]
```
## 游标属性：
- **%isopen**       游标是否打开
- **%found**        查看游标中是否有数据
- **%notfound**     查看游标中是否没有数据
- **%rowcount**     影响的行数

## 游标使用：
1. 使用的基本步骤：  
    声明游标 --> 打开游标   --> 操作游标    --> 关闭游标
2. **隐式游标**  
    sql语句就是隐式游标，默认名称就是sql。
    ```sql
    declare
        
    begin
        -- 执行更新
        update emp_bak e set s.sal=2000 where e.deptno=20;
        -- 对游标进行操作
        dbms_output.put_line(sql%rowcount);
        commit;
    end;
    ```
    
3. **静态游标**  
    不带参数的游标：
    ```sql
    declare
        -- 静态游标声明
        -- 语法  cursor 游标名 is select语句
        cursor v_emp_cursor is select * from emp;
        
        v_emp_row emp%rowtype;
    begin
        -- 打开游标
        open v_emp_cursor;
        loop
            --查询数据
            fetch v_emp_cursor into v_emp_row;
            --退出条件
            exit when v_emp_cursor%notfound;
            
            -- 输出数据
            dbms_output.put_line(v_emp_row.ename);
        end loop;
        
        
        -- 关闭游标
        close v_emp_cursor;
        
        
        -- 别的遍历方式
        
        -- for循环遍历
        -- for循环遍历 最简单  不需要打开游标，也不需要关闭游标，也可以不用声明变量
        
        for v_row in v_emp_cursor loop
            dbms_output.put_line(v_row.ename);
        end loop;
        
        
        -- while循环   配合%found
        open v_emp_cursor;
        fetch v_emp_cursor into v_emp_row;
        while v_emp_cursor%found loop
            dbms_output.put_line(v_emp_row.ename);
            fetch v_emp_cursor into v_emp_row;
        end loop;
        close v_emp_cursor;
    end;
    ```
    带参数的游标：
    ```sql
    declare
        -- 带参数的游标
        -- 参数可以有多个  但是参数只能有类型 不能有长度
        -- 参数的名称  不能喝表中的字段名称一样
        -- cursor 名称(参数名 类型,...) is select 语句
        cursor v_emp_cursor(l_deptno number,l_ename varchar2) is select * from emp e where e.deptno=l_deptno and e.ename like '%'||upper(l_ename)||'%';
        
        v_emp_row emp%rowtype;
    begin
    
    
        -- for循环遍历
        
        for v_row in v_emp_cursor(10,'k') loop
            dbms_output.put_line(v_row.ename);
        end loop;
    
    end;
    
    ```
   
   
4. **强类型游标**   
    先定义类型  在定义变量
    ```sql
    
    declare
        -- 动态游标  强类型
        -- 先定义类型  再定义变量
        -- 之所以叫强类型  是因为只能存储指定类型的数据
        -- 语法 type 名称 is ref cursor return 类型
        -- 定义类型
        type my_cursor is ref cursor return emp%rowtype;
        --定义变量
        v_cursor my_cursor;
        
        -- 定义行变量
        v_emp_row emp%rowtype;
        -- 或者以下定义也可以
        -- v_emp_row v_cursor%rowtype;
        
    begin
    
        -- 使用 open  for打开游标
        open v_cursor for select * from emp e;
        
        -- 可以使用 loop和while循环   但是 不能使用for循环
        loop
            fetch v_cursor into v_emp_row;
            exit when v_cursor%notfound;
            dbms_output.put_line(v_emp_row.ename);
        end loop;
        -- 关闭游标
        close v_cursor;
    end;
    
    ```

    
5. **弱类型游标**  
    先定义类型，再定义变量。
    ```sql
    declare
        -- 动态游标  弱类型
        -- 语法  type 名称 is ref cursor
        -- 先定义类型 再定义变量
        -- 弱类型游标  只是定义了一个集合 可以存储任何的数据类型
        
        -- 定义一个游标
        type my_cursor is ref cursor;
        
        -- 声明 emp表的游标
        v_emp_cursor my_cursor;
        -- 声明dept表的游标
        v_dept_cursor my_cursor;
        
        -- 声明emp行类型
        v_emp_row emp%rowtype;
        -- 声明dept行类型
        v_dept_row dept%rowtype;
    begin
    
        -- 遍历emp表
        open v_emp_cursor for select * from emp;
        loop
            fetch v_emp_cursor into v_emp_row;
            exit when v_emp_cursor%notfound;
            dbms_output.put_line(v_emp_row.ename);
        end loop;
        
        close v_emp_cursor;
        dbms_output.put_line('=========');
        
        -- 遍历dept表
        open v_dept_cursor for select * from dept;
        loop
            fetch v_dept_cursor into v_dept_row;
            exit when v_dept_cursor%notfound;
            dbms_output.put_line(v_dept_row.dname);
        end loop;
        close v_dept_cursor;
    end;
    
    ```
    
## 游标更新数据
使用游标对数据进行更新：
```sql

declare
    -- 声明游标
    -- 用 for update表示用于更新
    cursor emp_cursor(l_deptno number) is select * from emp_bak e where e.deptno=l_deptno for update;
    
begin

    for emp_row in emp_cursor(20) loop
        -- 更新值到当前的记录
        update emp_bak e set e.sal=30000 where current of emp_cursor;
        
    end loop;
    
    commit;
    -- 异常处理
    exception
        when others then
            rollback;
end;

```