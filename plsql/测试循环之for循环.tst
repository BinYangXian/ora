PL/SQL Developer Test script 3.0
43
-- ����ѭ��֮forѭ��

declare

    v_sum number := 0;

begin
    /*
        �﷨
        for ���� in ���� loop   -- (����  �������Զ�̬ƥ�伯�����������)
        
        end loop;
    */
    
    -- ����1��100�ĺ�
    
    for i in 1..100 loop
        v_sum := v_sum + i;
    end loop;
    
    dbms_output.put_line(v_sum);
    
    -- ����1��100֮��������ĺ�
    
    v_sum :=0;
    
    for i in 1..100 loop
    
        if mod(i,2)=0 then
            v_sum := v_sum+i;
        end if;
    end loop;
    
    dbms_output.put_line(v_sum);
    
    -- �������
    
    dbms_output.put_line('-----------------');
    for i in reverse 1..10 loop
        dbms_output.put_line(i);
    end loop;

end;
0
0
