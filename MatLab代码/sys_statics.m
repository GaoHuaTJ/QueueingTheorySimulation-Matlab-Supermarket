function T1=sys_statics(Gui)
%%此函数用于统计整个系统输出的指标

%输入Gui结构体
%输出统计指标的table
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
    customer_num=customer_num+temp_customer_num;%统计总的仿真人数
    temp_qunue=mean(Gui(i).qunue(:,2));
    total_Lq=temp_qunue+total_Lq;%所有柜台的总排队长度
    
    temp_wait=mean(Gui(i).wait);
    total_wait=total_wait+temp_wait;%s每个柜台的总排队时间
    
    temp_stay=mean(Gui(i).stay_time);%每个柜台的平均逗留时间
    total_stay=total_stay+temp_stay;
    
    busy(i)=length(find(Gui(i).busy(:,2)==1))/length(Gui(i).busy(:,2));%每个柜台的繁忙程度 
    
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

