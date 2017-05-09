-- 单行注释

/*
   多行注释
*/

-- 创建表
-- 在Oracle里面  表名和里面不要有引号  oracle中不区分大小写
-- 如果有驼峰命名的  需要用 “_” 隔开  userName   user_name
create table test_test(
       tid number(10) primary key,
       tname varchar2(200) not null
);

select "tname" from test_test;
