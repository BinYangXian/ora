-- 测试函数
-- 虚表 dual
-- 序列
select 'x' from dual;

-- 序列  属性  currval  nextval;
select seq_test_student.currval from dual;

select seq_test_student.nextval from dual;

insert into test_student(stu_id,stu_name,email,sex,age) values(seq_test_student.nextval,'zhangsan','zhangsan@zhangsan.com',1,110);
commit;

-- 字符串处理
select trim('    abc    '),ltrim('    abc    '),rtrim('    abc    ') from dual;

select concat(concat('a','b'),'c') ,'a'||'b'||'c' from dual;
-- 计算字符串长度
select length('abcd') from dual;

-- 取整
select ceil(4.7),floor(4.7) from dual;
-- 得到系统日期
select sysdate from dual;

select '2',to_number('2'),to_char(20) from dual;
-- 12  24小时
select to_date('2017-02-02 13:12:12','yyyy-mm-dd hh24:mi:ss') from dual;

-- 取默认值
-- nvl(列，默认值)  当指定的列的值为null时返回默认值
-- 相当于 if(列 == null) return 默认值;
-- 在oracle中 所有的值和null计算 都为null
select e.*, (e.sal+nvl(e.comm,0))*12 from emp e;

select e.*,decode(e.job,'PRESIDENT','牛人','MANAGER','小牛人','普通人') from emp e;
