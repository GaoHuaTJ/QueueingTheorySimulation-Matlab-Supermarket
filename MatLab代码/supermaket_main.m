%���������Գ���

%C���Ƿ����������
%time_limit�������ʱ��
%num_gui����̨����
%simulation_times���������
%choos_methods����̨��ѡ�񷽷�


clc
clear
load('my_halton.mat')%%�Լ������Ķ�Ӧ�ӷ���1



C.lamdaA=5;
C.lamdaB=0.1;%%time of buying
C.lamdaS=1;%% time of serving
time_limit=180;%����ʱ��



arrin=-1/C.lamdaA.*log(my_halton(1:1000,1));%�����ʱ����
carral=cumsum(arrin);%����ʱ��


ncus=max(find(carral<time_limit));%����ʱ����3��Сʱ֮ǰ����

carral=carral(1:ncus);%��Ӧ�ĵ���ʱ��
buying_time=-1/C.lamdaB.*log(my_halton(1:1000,2));%���������ѵ�ʱ��
buying_time=buying_time(1:ncus);
serving_time=-1/C.lamdaS.*log(my_halton(1:1000,3));
arr_gui=carral+buying_time;%%time when arrive serving Gui
%innitial Gui
%---------------------------------------------------------------------------------
num_gui=5;
for g=1:num_gui
    Gui(g).qunue=[0,0];%first number:time;second number:0-n quenue?
    Gui(g).busy=[0,0];%first number:time;second number:0-1 busy?
    Gui(g).future_leavetime=0;
    Gui(g).customer_num=[];
    Gui(g).servetime=[];
    Gui(g).start_serve_time=[];%��̨��ʼ�����ʱ��
    Gui(g).leavetime=[];%�뿪ʱ��
    Gui(g).stay_time=[];
end
%---------------------------------------------------------------------------
%main
m=1;
num_arrive_customer=0;%����˿ͼ�����
while num_arrive_customer<ncus
         [event_arrGui(m),id_arrGui]=min(arr_gui);
         leavetime=cell2mat({Gui.future_leavetime});%future_leavetime��ʾÿ��վ̨����Ҫ�뿪��ʱ��
   if leavetime==zeros(1,num_gui) %��ʼ����������뿪ʱ
      event(m)=event_arrGui(m);%mΪ�����¼�����Ӧ��ʱ��Ϊevent(m)
      id=id_arrGui;
      arr_gui(id)=[];%�¼�����ɾ���¼�
      arrive_flag=1;%�Ƿ�Ϊ�����¼���¼��
   else
         [event_leaveGui(m),id_leaveGui]=min(leavetime(leavetime~=0));
        if event_leaveGui(m)>event_arrGui(m)%����뿪ʱ����¼����ڵ����¼���ʱ��
            event(m)=event_arrGui(m);
            id=id_arrGui;
            arr_gui(id)=[];
            arrive_flag=1;
        else
            event(m)=event_leaveGui(m);
            id=id_leaveGui;
            arrive_flag=0;
        end
   end
   if arrive_flag==1  %%�Ե����¼��Ĵ���
       num_arrive_customer=num_arrive_customer+1;%%����������1���ƽ��¼�
       quenue_length=zeros(1,num_gui);%%%������¼��ǰÿ��վ̨ǰ����Ŷӳ���
         index_minlength_gui=choose_gui(Gui,"table_find");%%ѡ���̨����
        arr_gui_customer_servingtime=serving_time(num_arrive_customer);%����ʱ���ѡ��
       Gui=enventarrival(Gui,index_minlength_gui,num_arrive_customer,arr_gui_customer_servingtime,event(m));%���ﺯ�������������
   else         
        special2=find(leavetime==min(leavetime(leavetime~=0)));%�ҵ���ǰվ̨�������뿪ʱ���վ̨
        if length(special2)==1%��ֻ��һ��������վ̨��¼
             index_minleavetime_gui=special2;
         else
             index_minleavetime_gui=special2(randperm(length(special2),1));%���ʺ�С����֤�ݴ��ԣ���ʵ������ͬʱ������������뿪ʱ���վ̨�����ѡ������һ���ȴ���
        end 
             Gui=eventleave(Gui,index_minleavetime_gui,event(m));%�뿪�¼�����
   end
   m=m+1;
end
