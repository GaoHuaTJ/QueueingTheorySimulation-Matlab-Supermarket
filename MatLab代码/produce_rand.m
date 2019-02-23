%%����halton�����������
function y=produce_rand(N_hal_row,zhishu)
    y=zeros(N_hal_row,size(zhishu,2));%��ʼ��Halton����
    for i=1:size(zhishu,2)%���ӵ�������¼����������
        for j=1:N_hal_row%��������
            index=j;
            temp=1.0/zhishu(i);
            flag=0;
            while index>0
                flag=flag+temp*mod(index,zhishu(i));
                index=floor(index/zhishu(i));
                temp=temp/zhishu(i);
            end
            y(j,i)=flag;%�������������
        end 
    end
end    