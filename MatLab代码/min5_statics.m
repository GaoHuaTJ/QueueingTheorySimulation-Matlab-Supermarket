function Lq=min5_statics(Gui,time_limit)
%5���Ӷӳ�ͳ�ƺ���
      num_gui=size(Gui,2);
      T=time_limit;
    for h=1:num_gui
        Lq(h).lq=zeros(2,floor(T/5));
        for i=1:floor(T/5)
            Lq(h).lq(1,i)=5*i;
            for j=1:length(Gui(h).customer_num)
                    if Gui(h).start_serve_time(j)-Gui(h).wait(j)>=5*i%�����̨��ʱ�䣬�����5�ı����ڵ���ʱ��֮��
                        for k=1:j-1                                  %���������֮ǰ�����й˿�
                            if Gui(h).leavetime(k)>5*i               %�����뿪ʱʱ���ڲ����5�ı���ʱ��֮����˵�����Ŷ�
                               Lq(h).lq(2,i)=Lq(h).lq(2,i)+1;
                            end
                        end
                        if Gui(h).start_serve_time(j)-Gui(h).wait(j)==5*i %���ǵ����̨��ʱ��������5�ı���������˱�Ȼ���Ŷ�
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
                if Gui(h).start_serve_time(j)-Gui(h).wait(j)<5*i %��֤180����ʱ��Ľڵ�
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