function Lq=min5_statics(Gui,time_limit)
%5分钟队长统计函数
      num_gui=size(Gui,2);
      T=time_limit;
    for h=1:num_gui
        Lq(h).lq=zeros(2,floor(T/5));
        for i=1:floor(T/5)
            Lq(h).lq(1,i)=5*i;
            for j=1:length(Gui(h).customer_num)
                    if Gui(h).start_serve_time(j)-Gui(h).wait(j)>=5*i%到达柜台的时间，插入的5的倍数在到达时间之后
                        for k=1:j-1                                  %遍历这个人之前的所有顾客
                            if Gui(h).leavetime(k)>5*i               %若其离开时时间在插入的5的倍数时间之后，则说明其排队
                               Lq(h).lq(2,i)=Lq(h).lq(2,i)+1;
                            end
                        end
                        if Gui(h).start_serve_time(j)-Gui(h).wait(j)==5*i %若是到达柜台的时间正好是5的倍数，则此人必然在排队
                                if Gui(h).wait(j)>0
                                    Lq(h).lq(2,i)=Lq(h).lq(2,i)+1;
                                end
                        end
                        if Lq(h).lq(2,i)>0
                            Lq(h).lq(2,i)=Lq(h).lq(2,i)-1;
                        end
                    break;
                    end
            end
                if Gui(h).start_serve_time(j)-Gui(h).wait(j)<5*i %保证180分钟时间的节点
                    for k=1:length(Gui(h).customer_num)
                        if Gui(h).leavetime(k)>5*i
                            Lq(h).lq(2,i)=Lq(h).lq(2,i)+1;
                        end
                    end
                        if Lq(h).lq(2,i)>0
                            Lq(h).lq(2,i)=Lq(h).lq(2,i)-1;
                        end
                end
        end
    end
end