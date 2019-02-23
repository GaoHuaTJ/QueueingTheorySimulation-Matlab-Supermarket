function T=gui_statics(Gui)
%此函数用于统计各个g柜台的统计指标


num_gui=size(Gui,2);
for i=1:num_gui
    wait_mean(i)=sum(Gui(i).wait)/length(Gui(i).wait);%平均排队等待时间
    wait_max(i)=max(Gui(i).wait);
    stay_time_mean(i)=sum(Gui(i).stay_time)/length(Gui(i).stay_time);%平均逗留时间
    Lq_max(i)=max(Gui(i).qunue(:,2));%最大排队长度
    Lq_mean(i)=mean(Gui(i).qunue(:,2));%平均排队长度
    busy(i)=length(find(Gui(i).busy(:,2)==1))/length(Gui(i).busy(:,2));%每个柜台的繁忙程度 
end
for i=1:num_gui
    rowname(i)=i;
end 
T=table;
T.rowname=rowname';
T.gui_busy=busy';
T.gui_waitmax=wait_max';
T.gui_waitmean=wait_mean';
T.gui_stay_time_mean=stay_time_mean';
T.gui_Lq_max=Lq_max';
T.gui_Lq_mean=Lq_mean';
disp(T)
end


