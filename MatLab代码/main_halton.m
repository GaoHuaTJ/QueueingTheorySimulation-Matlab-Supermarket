function my_halton=main_halton(N_hal_row,N_hal_culumn)
%%Halton 产生函数和储存
%%算法参考:
%https://en.wikipedia.org/wiki/Halton_sequence（原理）
%https://github.com/turanszkij/HaltonGenerator/blob/master/HaltonGenerator.cpp（基于c++）

if nargin==0 %若该函无输入参数时，默认的行数和列数
    N_hal_culumn=8;
    N_hal_row=10000;
end

flag=1;
zhishu=[];%储存产生的质数，随机数种子
while length(zhishu)<N_hal_culumn
     zhishu=primes(flag);%primes函数为内置函数，产生截止flag的质数
     flag=flag+1;
end
my_halton=produce_rand(N_hal_row,zhishu);
save my_halton my_halton;
end
