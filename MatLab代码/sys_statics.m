function T1=sys_statics(Gui)
%%�˺�������ͳ������ϵͳ�����ָ��

%����Gui�ṹ��
%���ͳ��ָ���table
Q=[];
num_gui=size(Gui,2);
total_Lq=0;
max_wait=[];
total_wait=0;
total_stay=0;
customer_num=0;

    rowname=1;

for i=1:num_gui
    Q=[Q Gui(i).wait];
    temp_customer_num=length(Gui(i).customer_num);
    customer_num=customer_num+temp_customer_num;%ͳ���ܵķ�������
    temp_qunue=mean(Gui(i).qunue(:,2));
    total_Lq=temp_qunue+total_Lq;%���й�̨�����Ŷӳ���
    
    temp_wait=mean(Gui(i).wait);
    total_wait=total_wait+temp_wait;%sÿ����̨�����Ŷ�ʱ��
    
    temp_stay=mean(Gui(i).stay_time);%ÿ����̨��ƽ������ʱ��
    total_stay=total_stay+temp_stay;
    
    busy(i)=length(find(Gui(i).busy(:,2)==1))/length(Gui(i).busy(:,2));%ÿ����̨�ķ�æ�̶� 
    
end


mean_Lq=total_Lq/num_gui;
max_wait=max(Q);
mean_wait=total_wait/num_gui;
mean_stay=total_stay/num_gui;
mean_busy=mean(busy);

T1=table;
T1.rowname=rowname';
T1.mean_Lq=mean_Lq';
T1.max_wait=max_wait';
T1.mean_wait=mean_wait;
T1.mean_stay=mean_stay';
T1.mean_busy=mean_busy';

end

