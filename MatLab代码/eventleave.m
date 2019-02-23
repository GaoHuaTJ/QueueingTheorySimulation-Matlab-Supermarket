function Gui=eventleave(Gui,index_minleavetime_gui,event_time)
%%离开事件函数
%输入：事件发生前的Gui结构体，最早发生离开时间的柜台的编号，事件时刻
%输出：对于Gui结构体的更新
    id_customer_leave=find(Gui(index_minleavetime_gui).leavetime==event_time);%发生离开时间的是第几个顾客
    ID_set=length(Gui(index_minleavetime_gui).customer_num);%最小柜台的g顾客ID集的长度
    if id_customer_leave<ID_set-1  %多个离开事件待处理，离开之后仍有人排队（包括即将服务的人）
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,Gui(index_minleavetime_gui).qunue(end,2)-1];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,1];
        Gui(index_minleavetime_gui).future_leavetime=Gui(index_minleavetime_gui).leavetime(id_customer_leave+1);
    elseif id_customer_leave==ID_set-1  %是倒数第二个人（两个离开事件已经待处理，但是下一个离开事件之后没有排队（即将服务的人后面无人排队）
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,0];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,1];
        Gui(index_minleavetime_gui).future_leavetime=Gui(index_minleavetime_gui).leavetime(id_customer_leave+1);
    else  %是最后一个人
        Gui(index_minleavetime_gui).qunue=[Gui(index_minleavetime_gui).qunue;event_time,0];
        Gui(index_minleavetime_gui).busy=[Gui(index_minleavetime_gui).busy;event_time,0];
        Gui(index_minleavetime_gui).future_leavetime=0;
    end  
end