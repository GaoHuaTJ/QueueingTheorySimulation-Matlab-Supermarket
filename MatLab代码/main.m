 function [Gui,T2,P]=main(C,time_limit,num_gui,simulation_times,choose_methods)
 %������
%C���Ƿ����������
% time_limit�������ʱ��
% num_gui����̨����
% simulation_times���������
% choos_methods����̨��ѡ�񷽷�
%T2 ����ͳ��ÿ�η����ϵͳͳ�ƽ�����
%����ÿ5���ӵ�ϵͳ�Ŷ������ܺ�
T2=[];
P=[];%����ÿ5���ӵ�ϵͳ�Ŷ������ܺ�
h=waitbar(0,'��������У����Ե�');%������

if nargin==0 %h�����������������Ϊ0�������
    
 C.lamdaA=5;
 C.lamdaB=0.1;%%time of buying
 C.lamdaS=1;%% time of serving
 num_gui=5;
 time_limit=180;
 choose_methods='rank_shortest';
 simulation_times=30;
end   
%------------------------------------------------------------------------------------------------------------------------------------------��η���
    for k=1:simulation_times
%              clc
        % clear      
%--------------------------------------------------------------------------
%���Է��֣����Ƕ�η��棬����Halton�������Ч������������������ʿ��ǲ�����Matlab�����rand���������ж��ģ�����
%        load('my_halton.mat')%%�Լ������Ķ�Ӧ�ӷ���1
%         arrin=-1/C.lamdaA.*log(my_halton(1:1000,3*k-2));%�����ʱ����
%         serving_time=-1/C.lamdaS.*log(my_halton(1:1000,3*k));
%         buying_time=-1/C.lamdaB.*log(my_halton(1:1000,3*k-1));%���������ѵ�ʱ��
%--------------------------------------------------------------------------
       
        arrin=-1/C.lamdaA.*log(rand(1000,1));%�����ʱ����
        serving_time=-1/C.lamdaS.*log(rand(1000,1));
        buying_time=-1/C.lamdaB.*log(rand(1000,1));%���������ѵ�ʱ��
        carral=cumsum(arrin);%����ʱ��
        ncus=max(find(carral<time_limit));%����ʱ����3��Сʱ֮ǰ����
        carral=carral(1:ncus);%��Ӧ�ĵ���ʱ��
        buying_time=buying_time(1:ncus);
        arr_gui=carral+buying_time;%%time when arrive serving Gui
        %innitial Gui
        %---------------------------------
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
                if event_leaveGui(m)>event_arrGui(m)
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
               num_arrive_customer=num_arrive_customer+1;%%����������1
               quenue_length=zeros(1,num_gui);%%%������¼��ǰÿ��վ̨ǰ����Ŷӳ���
                 index_minlength_gui=choose_gui(Gui,choose_methods);%%ѡ���̨����
                arr_gui_customer_servingtime=serving_time(num_arrive_customer);%����ʱ���ѡ��
               Gui=enventarrival(Gui,index_minlength_gui,num_arrive_customer,arr_gui_customer_servingtime,event(m));%���ﺯ�������������
           else         
                special2=find(leavetime==min(leavetime(leavetime~=0)));%�ҵ���ǰվ̨�������뿪ʱ���վ̨
                if length(special2)==1%��ֻ��һ��������վ̨��¼
                     index_minleavetime_gui=special2;
                 else
                     index_minleavetime_gui=special2(randperm(length(special2),1));%��������뿪ʱ���վ̨�����ѡ������һ��
                end 
                     Gui=eventleave(Gui,index_minleavetime_gui,event(m));%�뿪�¼�����
           end
           m=m+1;
        end
        Ti=sys_statics(Gui);
        Ti=table2array(Ti);
        T2=[T2;Ti];
        waitbar(k/simulation_times)
%--------------------------------------------------------------------------------------����5���Ӷӳ����ֵ�ͳ��������
        Lq=min5_statics(Gui,time_limit);
        p=[];
        for j=1:size(Lq,2)
            p=[p;Lq(j).lq(2,:)]; 
        end
        P=[P;sum(p)]; 
%-----------------------------------------------------------------------------------
    end
    close(h);
 end
