-- ������
/*
   ������js�е�  �¼�������
   
   :new
   :old
*/

-- delete from dept where deptno=10;

update dept set deptno=99 where deptno=10;

-- update emp e set e.deptno=10 where e.deptno is null;

create or replace trigger tr_update_deptno
before update on dept for each row
begin
  
       -- �����Զ��ύ
       update emp e set e.deptno=:new.deptno where e.deptno=:old.deptno;

end;

