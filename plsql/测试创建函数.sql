-- ���Դ�������
/*
   �����Ľṹ
   
   create [or replace] function ������ (����..) return ����ֵ����
   is
   begin
     
   end;
   
   ��������  ������sql����е��ú���
   
   
*/

create or replace function sxt_concat(str1 varchar2,str2 varchar2) return varchar2
is

begin
  
    return str1||str2;
end;

-- ���ú���

select sxt_concat('a','b') from dual;
