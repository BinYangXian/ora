PL/SQL Developer Test script 3.0
22
-- ����if���
declare
    -- ��������
    -- dbms_random.value ���������
    -- floor ȡ��
    v_number1 number := floor(dbms_random.value*6)+1;
    v_number2 number := floor(dbms_random.value*6)+1;
    v_number3 number := floor(dbms_random.value*6)+1;
    v_sum number := 0;
begin
    -- �����
    v_sum := v_number1+v_number2+v_number3;
    -- �ж�
    if v_sum>12 then
        dbms_output.put_line('��������');
    elsif v_sum>6 and v_sum<=12 then
        dbms_output.put_line('����һ��');
    else
        dbms_output.put_line('�����ܲ�');
    end if;

end;
0
0
