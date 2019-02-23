function Gui=enventarrival(Gui,index_minlength_gui,num_arrive_customer,arr_gui_customer_servingtime,event_time)
%%到达事件函数----------------确定当前事件为到达事件之后，对当前的事件进行处理
%输入：当前时间事件之前的Gui结构体，选出的最小排队队长柜台的编号，到达顾客的数量，到达柜台的顾客的服务时间，当前的事件事件
%输出：Gui结构体的数据更新

    Gui(index_minlength_gui).customer_num=[Gui(index_minlength_gui).customer_num,num_arrive_customer];%将该顾客的ID存入选出的Gui的编号的顾客ID矩阵
    j=length(Gui(index_minlength_gui).customer_num);
    Gui(index_minlength_gui).servetime(j)=arr_gui_customer_servingtime;%将该顾客到达柜台的服务时间存入集合
    
    if j==1%如果是该柜台的第一个顾客，相应的数据储存
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=0;
        Gui(index_minlength_gui).start_serve_time(j)=event_time;
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,0];
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).future_leavetime=Gui(index_minlength_gui).leavetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);  
    elseif event_time<Gui(index_minlength_gui).leavetime(j-1)%如该事件的时刻（到达柜台的时刻）小于该柜台前一个顾客的离开时间，则需要排队
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=Gui(index_minlength_gui).leavetime(j-1)-event_time;%等待时间计算
        Gui(index_minlength_gui).start_serve_time(j)=Gui(index_minlength_gui).leavetime(j-1);%开始服务时间
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,Gui(index_minlength_gui).qunue(end,2)+1];%排队队长更新
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);
    else%其他的则是来了之后直接服务
        Gui(index_minlength_gui).busy=[Gui(index_minlength_gui).busy;event_time,1];
        Gui(index_minlength_gui).wait(j)=0;
        Gui(index_minlength_gui).start_serve_time(j)=event_time;
        Gui(index_minlength_gui).qunue=[Gui(index_minlength_gui).qunue;event_time,0];
        Gui(index_minlength_gui).leavetime(j)=Gui(index_minlength_gui).start_serve_time(j)+Gui(index_minlength_gui).servetime(j);
        Gui(index_minlength_gui).future_leavetime=Gui(index_minlength_gui).leavetime(j);
        Gui(index_minlength_gui).stay_time(j)=Gui(index_minlength_gui).wait(j)+Gui(index_minlength_gui).servetime(j);  
    end
end