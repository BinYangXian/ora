--���Դ�����
/*

�����������Ļ����﷨
  create [or replace] trigger tr_���� 
  before|after update or delete or insert on ���� [for each row]
  begin
      -- ����ɾ�������   �Զ��ύ����
  end;
  
  :new
  :old
*/

update dept d1 set d1.deptno=99 where d1.deptno=10;

create or replace trigger tr_update_dept before update on dept for each row

begin
  update emp e set e.deptno=:new.deptno where e.deptno=:old.deptno;
end;
