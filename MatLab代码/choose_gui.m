function index_minlength_gui=choose_gui(Gui,way)
%%选择柜台函数
%此函数输入：Gui:当前的Gui的情况，way:选择柜台号的方法的参数，有三个可选参数：
%way="rand_shortest":有多个柜台的排队长度最短，从其中随机选出一个
%way="rank_shortest":有多个柜台的排队长度最短，从中按照ABCD的顺序选择
%way="table_find":表搜索法寻找最短的排队长度

%输出：选择小的服务台号

p=[];%储存当前Gui中的排队队长的最短的编号
if nargin==1  %如果输入参数为1个，即只输入了Gui，默认是方式rank_shortest
 quenue_length=[];
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);%储存当前各个柜台的排队队长
                if Gui(i).busy(end,2)==0%如果当前Gui的状态下，其最后busy矩阵的最后一行为空闲则代表该时刻该柜台是空闲的
                    p=[p;i];%服务台空闲的,肯定排队人数为0
                end
            end  
            if length(p)~=0 %表明柜台中有多个是空闲的
                index_minlength_gui=min(p);%按照顺序选编号最小的那个柜台
            else
                special=find(quenue_length==min(quenue_length));%找到排队最短的站台
                    if length(special)==1 %如果排队最短的站台只有一个，选它
                        index_minlength_gui=special;
                    else
                         index_minlength_gui=min(find(quenue_length==min(quenue_length)));%多个排队最短的站台，选第一个柜台
                    end 
            end      
elseif nargin==2 %如果输入参数有两个
    if way=="rand_shortest"
        quenue_length=[];
        for i=1:size(Gui,2)
           quenue_length(i)=Gui(i).qunue(end,2);
            if Gui(i).busy(end,2)==0
                    p=[p;i];%服务台空闲的,肯定排队人数为0
            end
        end  
        if length(p)~=0%存在多个柜台是空闲的
            index_minlength_gui=p(randpern(length(p),1));%多个空闲柜台时，随机选一个
        else
            special=find(quenue_length==min(quenue_length));%找到排队最短的站台对的索引矩阵
           if length(special)==1 %如果排队最短的站台只有一个，选它
               index_minlength_gui=special;
           else
               index_minlength_gui=special(randperm(length(special),1));%多个排队最短的站台，随机选一个
           end
        end  
    elseif way=="rank_shortest"
        %此参数下当同时存在一样的队长的是时候选
        
            quenue_length=[];
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);
                if Gui(i).busy(end,2)==0
                    p=[p;i];%服务台空闲的,肯定排队人数为0
                end
            end  
            if length(p)~=0
                index_minlength_gui=min(p);
            else
                special=find(quenue_length==min(quenue_length));%找到排队最短的站台
                    if length(special)==1 %如果排队最短的站台只有一个，选它
                        index_minlength_gui=special;
                    else
                         index_minlength_gui=min(find(quenue_length==min(quenue_length)));%多个排队最短的站台，选第一个柜台
                    end 
            end
    elseif way=="table_find"
           quenue_length=[];%队长储存矩阵
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);
            end  
            special=find(quenue_length==min(quenue_length));%找到排队最短的站台
            if length(special)==1 %如果排队最短的站台只有一个，选它
               index_minlength_gui=special;
            else
                table=[];
              temp=length(quenue_length);%表搜索法区间的数量
              for i=1:temp
                  table(i)=1/temp*i;%区间划分
              end
                flag=rand(1);%产生随机数
                table=[table flag];%将产生的随机数存入区间倒数矩阵
                index_minlength_gui=find(flag==sort(table));%排序，找到随机数的索引位置
            end  
    end
end 
end