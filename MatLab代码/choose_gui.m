function index_minlength_gui=choose_gui(Gui,way)
%%ѡ���̨����
%�˺������룺Gui:��ǰ��Gui�������way:ѡ���̨�ŵķ����Ĳ�������������ѡ������
%way="rand_shortest":�ж����̨���Ŷӳ�����̣����������ѡ��һ��
%way="rank_shortest":�ж����̨���Ŷӳ�����̣����а���ABCD��˳��ѡ��
%way="table_find":��������Ѱ����̵��Ŷӳ���

%�����ѡ��С�ķ���̨��

p=[];%���浱ǰGui�е��ŶӶӳ�����̵ı��
if nargin==1  %����������Ϊ1������ֻ������Gui��Ĭ���Ƿ�ʽrank_shortest
 quenue_length=[];
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);%���浱ǰ������̨���ŶӶӳ�
                if Gui(i).busy(end,2)==0%�����ǰGui��״̬�£������busy��������һ��Ϊ����������ʱ�̸ù�̨�ǿ��е�
                    p=[p;i];%����̨���е�,�϶��Ŷ�����Ϊ0
                end
            end  
            if length(p)~=0 %������̨���ж���ǿ��е�
                index_minlength_gui=min(p);%����˳��ѡ�����С���Ǹ���̨
            else
                special=find(quenue_length==min(quenue_length));%�ҵ��Ŷ���̵�վ̨
                    if length(special)==1 %����Ŷ���̵�վֻ̨��һ����ѡ��
                        index_minlength_gui=special;
                    else
                         index_minlength_gui=min(find(quenue_length==min(quenue_length)));%����Ŷ���̵�վ̨��ѡ��һ����̨
                    end 
            end      
elseif nargin==2 %����������������
    if way=="rand_shortest"
        quenue_length=[];
        for i=1:size(Gui,2)
           quenue_length(i)=Gui(i).qunue(end,2);
            if Gui(i).busy(end,2)==0
                    p=[p;i];%����̨���е�,�϶��Ŷ�����Ϊ0
            end
        end  
        if length(p)~=0%���ڶ����̨�ǿ��е�
            index_minlength_gui=p(randpern(length(p),1));%������й�̨ʱ�����ѡһ��
        else
            special=find(quenue_length==min(quenue_length));%�ҵ��Ŷ���̵�վ̨�Ե���������
           if length(special)==1 %����Ŷ���̵�վֻ̨��һ����ѡ��
               index_minlength_gui=special;
           else
               index_minlength_gui=special(randperm(length(special),1));%����Ŷ���̵�վ̨�����ѡһ��
           end
        end  
    elseif way=="rank_shortest"
        %�˲����µ�ͬʱ����һ���Ķӳ�����ʱ��ѡ
        
            quenue_length=[];
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);
                if Gui(i).busy(end,2)==0
                    p=[p;i];%����̨���е�,�϶��Ŷ�����Ϊ0
                end
            end  
            if length(p)~=0
                index_minlength_gui=min(p);
            else
                special=find(quenue_length==min(quenue_length));%�ҵ��Ŷ���̵�վ̨
                    if length(special)==1 %����Ŷ���̵�վֻ̨��һ����ѡ��
                        index_minlength_gui=special;
                    else
                         index_minlength_gui=min(find(quenue_length==min(quenue_length)));%����Ŷ���̵�վ̨��ѡ��һ����̨
                    end 
            end
    elseif way=="table_find"
           quenue_length=[];%�ӳ��������
            for i=1:size(Gui,2)
                quenue_length(i)=Gui(i).qunue(end,2);
            end  
            special=find(quenue_length==min(quenue_length));%�ҵ��Ŷ���̵�վ̨
            if length(special)==1 %����Ŷ���̵�վֻ̨��һ����ѡ��
               index_minlength_gui=special;
            else
                table=[];
              temp=length(quenue_length);%�����������������
              for i=1:temp
                  table(i)=1/temp*i;%���仮��
              end
                flag=rand(1);%���������
                table=[table flag];%��������������������䵹������
                index_minlength_gui=find(flag==sort(table));%�����ҵ������������λ��
            end  
    end
end 
end