function my_halton=main_halton(N_hal_row,N_hal_culumn)
%%Halton ���������ʹ���
%%�㷨�ο�:
%https://en.wikipedia.org/wiki/Halton_sequence��ԭ��
%https://github.com/turanszkij/HaltonGenerator/blob/master/HaltonGenerator.cpp������c++��

if nargin==0 %���ú����������ʱ��Ĭ�ϵ�����������
    N_hal_culumn=8;
    N_hal_row=10000;
end

flag=1;
zhishu=[];%������������������������
while length(zhishu)<N_hal_culumn
     zhishu=primes(flag);%primes����Ϊ���ú�����������ֹflag������
     flag=flag+1;
end
my_halton=produce_rand(N_hal_row,zhishu);
save my_halton my_halton;
end
