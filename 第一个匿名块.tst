PL/SQL Developer Test script 3.0
38
-- ��һ��������

/**
declare
   ֻ�ܽ��б������������߱����������͸�ֵ
begin
  �����ĸ�ֵ(������������)
  ҵ�����

end;


*/
declare 
  -- ��������  �﷨
  -- [constant] ������  ����[����] [:=ֵ]
  -- ���ڸ�ֵ
  -- :=  ��ֵ
  -- select into ���ڴӱ��еõ�ֵ����ֵ������ 
  -- fetch into  ���ڴ��α��еĵõ�ֵ����ֵ������
  
  num1 number;
  
  num2 number := 20;
begin
  

   num1 :=30;
   -- System.out.println();
   dbms_output.put_line('123123');
   -- ��ֵ���뻺����  ���������  ֻҪ������������з���ʱ��Ż����
   dbms_output.put('admin' || '   '||num1);  
   -- ������з�
   dbms_output.new_line;  
   
   
  
end;
0
0
