# 函数
侧重点是返回结果  换句话说  就是一定要有返回值

## 函数结构
```sql

/*
    语法结构
    
    create [or replace] function 函数名(参数...)
    return 返回值类型
    is
    begin
    
    end;
*/

-- 写一个简单的函数例子 用于字符拼接

create or replace function sxt_concat(str1 varchar2,str2 varchar2) 
return varchar2
is
begin
    return str1||str2;
end;


```

函数调用：

在sql window中输入：  

```sql
select sxt_concat('a','b') from dual;
```
