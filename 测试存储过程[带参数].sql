-- ���Դ洢����[������]
-- �洢���̵Ĳ�������
-- in  ���ⲿ�������
-- out  ���ڲ�������ⲿ
-- in out   �ȿ������� Ҳ�������

--  ֻҪ��out���εĲ���  �������ظ���ֵ  ����  �����ٸ�ֵ

-- ���벿�ź�  ����ò������������Ա����ƽ������
create or replace procedure p_sal(l_deptno in number,l_avg out number,l_success in out number)
is
  v_avg number;
begin
   
  l_success :=1;
  select avg(e.sal) into v_avg from emp e where e.deptno=l_deptno;
  if v_avg is null then
    l_avg :=0;
    raise no_data_found;  
  end if;
  
  l_avg :=v_avg;
  
  exception 
    when others then
      l_success :=0;
 
end;
