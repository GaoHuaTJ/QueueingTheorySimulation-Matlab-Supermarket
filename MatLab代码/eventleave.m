function Gui=eventleave(Gui,index_minleavetime_gui,event_time)
%%�뿪�¼�����
%���룺�¼�����ǰ��Gui�ṹ�壬���緢���뿪ʱ��Ĺ�̨�ı�ţ��¼�ʱ��
%���������Gui�ṹ��ĸ���
    id_customer_leave=find(Gui(index_minleavetime_gui).leavetime==event_time);%�����뿪ʱ����ǵڼ����˿�
    ID_set=length(Gui(index_minleavetime_gui).customer_num);%��С��̨��g�˿�ID���ĳ���
    if id_customer_leave<ID_set-1  %����뿪�¼��������뿪֮���������Ŷӣ���������������ˣ�
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,Gui(index_minleavetime_gui).qunue(end,2)-1];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,1];
        Gui(index_minleavetime_gui).future_leavetime=Gui(index_minleavetime_gui).leavetime(id_customer_leave+1);
    elseif id_customer_leave==ID_set-1  %�ǵ����ڶ����ˣ������뿪�¼��Ѿ�������������һ���뿪�¼�֮��û���Ŷӣ�����������˺��������Ŷӣ�
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,0];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,1];
        Gui(index_minleavetime_gui).future_leavetime=Gui(index_minleavetime_gui).leavetime(id_customer_leave+1);
    else  %�����һ����
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,0];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,0];
        Gui(index_minleavetime_gui).future_leavetime=0;
    end  
end