-- ���԰�ͷ
create or replace package my_pack
is 
   --�������� �������������͸�ֵ  ȫ�ֵ�
   num1 number :=20;
   num2 number ;
   
   -- �������ߴ洢����  ֻ�ǽṹ����  ������ȥʵ��
   
   function func(num1 number,num2 number) return number;
   function func(str1 varchar2,str2 varchar2) return varchar2;
   
   procedure p_test_sal(l_deptno number,l_avg number);
       
end;


-- ��������  ȥʵ�ְ�ͷ�еĴ��붨��
create or replace package body my_pack
is 
 -- �������� �������������͸�ֵ   ˽�е�
 -- ʵ����صĴ�������
 
    function func(num1 number,num2 number) return number
    is
    
    begin
      return num1+num2;
    end;
    
    function func(str1 varchar2,str2 varchar2) return varchar2
    is
    
    begin
      return str1||str2;
    end;
    
    procedure p_test_sal(l_deptno number,l_avg number)
    is
              
    begin
      select avg(e.sal) into l_avg from emp e where e.deptno = l_deptno;
    end;
begin
  dbms_output.put_line('');  
end;

select my_pack.num1 from dual;
