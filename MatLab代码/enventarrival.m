function Gui=enventarrival(Gui,index_minlength_gui,num_arrive_customer,arr_gui_customer_servingtime,event_time)
%%�����¼�����----------------ȷ����ǰ�¼�Ϊ�����¼�֮�󣬶Ե�ǰ���¼����д���
%���룺��ǰʱ���¼�֮ǰ��Gui�ṹ�壬ѡ������С�ŶӶӳ���̨�ı�ţ�����˿͵������������̨�Ĺ˿͵ķ���ʱ�䣬��ǰ���¼��¼�
%�����Gui�ṹ������ݸ���

    Gui(index_minlength_gui).customer_num=[Gui(index_minlength_gui).customer_num,num_arrive_customer];%���ù˿͵�ID����ѡ����Gui�ı�ŵĹ˿�ID����
    j=length(Gui(index_minlength_gui).customer_num);
    Gui(index_minlength_gui).servetime(j)=arr_gui_customer_servingtime;%���ù˿͵����̨�ķ���ʱ����뼯��
    
    if j==1%����Ǹù�̨�ĵ�һ���˿ͣ���Ӧ�����ݴ���
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=0;
        Gui(index_minlength_gui).start_serve_time(j)=event_time;
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,0];
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).future_leavetime=Gui(index_minlength_gui).leavetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);  
    elseif event_time<Gui(index_minlength_gui).leavetime(j-1)%����¼���ʱ�̣������̨��ʱ�̣�С�ڸù�̨ǰһ���˿͵��뿪ʱ�䣬����Ҫ�Ŷ�
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=Gui(index_minlength_gui).leavetime(j-1)-event_time;%�ȴ�ʱ�����
        Gui(index_minlength_gui).start_serve_time(j)=Gui(index_minlength_gui).leavetime(j-1);%��ʼ����ʱ��
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,Gui(index_minlength_gui).qunue(end,2)+1];%�ŶӶӳ�����
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);
    else%��������������֮��ֱ�ӷ���
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=0;
        Gui(index_minlength_gui).start_serve_time(j)=event_time;
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,0];
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).future_leavetime=Gui(index_minlength_gui).leavetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);  
    end
end