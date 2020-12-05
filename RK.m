function [ t,y ] = RK( F,tspan,y0,h )
%四阶龙格-库塔法
%F为计算的函数,返回值是一维列向量，tspan为计算时间[t0 tf]，y0为计算初值，是一维
%行向量，h代表步长
t0=tspan(1);        %取出计算初始时间
tf=tspan(2);        %取出计算截至时间
y=y0;               %方程组初值放入y(1,:)
k=1;                %记录第tk时刻方程组的的解在y中第k行,t0时刻为1；
for t=t0+h:h:tf     
    K1=h*feval(F,t,y(k,:))';      
    K2=h*feval(F,t+h/2,y(k,:)+0.5*K1)';
    K3=h*feval(F,t+h/2,y(k,:)+0.5*K2)';
    K4=h*feval(F,t+h,y(k,:)+K3)';   %计算K1,K2,K3,K4
    
    yt=y(k,:)+(K1+2*K2+2*K3+K4)/6;  %计算tk+1时刻方程组的解
    y=[y;yt];   	%将yt放入y中第k+1行
    k=k+1;          %k只想k+1行
end
t=t0:h:tf;          %赋值t为[t0,tf]

