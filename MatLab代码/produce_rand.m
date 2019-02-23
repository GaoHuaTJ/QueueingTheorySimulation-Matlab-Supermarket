%%生成halton随机均匀数列
function y=produce_rand(N_hal_row,zhishu)
    y=zeros(N_hal_row,size(zhishu,2));%初始化Halton矩阵
    for i=1:size(zhishu,2)%种子的索引记录，列数控制
        for j=1:N_hal_row%行数控制
            index=j;
            temp=1.0/zhishu(i);
            flag=0;
            while index>0
                flag=flag+temp*mod(index,zhishu(i));
                index=floor(index/zhishu(i));
                temp=temp/zhishu(i);
            end
            y(j,i)=flag;%产生随机数储存
        end 
    end
end    