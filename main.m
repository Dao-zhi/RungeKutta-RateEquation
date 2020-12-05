clear;
global c sigma l l_t t_r gamma N_t tao_a Rp epsilon %定义全局变量

c=3e8;                              %真空中光速 (m/s)
sigma=6.5e-23;                      %受激发射截面 (m^2)
l=0.16;                             %增益介质长度 (m)
l_t=0.69;                           %激光器总腔长 (m)
R=0.4;                              %输出镜反射率
L=0.1;                              %耗散损耗
epsilon=-log(R)+L;                  %计算总损耗
t_r=2*l_t/c;                        %腔中往返时间 (s)
gamma=1;                            %反转因子
N_t=1.38e26;                        %总粒子数 (m^-3)
tao_a = 230e-6;                     %增益介质的上能级寿命(s)
Rp=1e29;                            %抽运速率 (1/(s*m^-3))
nt=1/(2*sigma*l)*(epsilon);         %阈值反转粒子数密度 (m^-3)

tf=0.000008*2;                      %计算截止时间
y0=[1 0];                           %耦合速率方程组初值.由于自发辐射光子数密度初值为1
tspan=[0 tf];                       %计算时间
tic
%[t,y] = ode45('Rate',tspan,y0);     %利用Runge-Kutta法解速率方程组Rate
[t,y] = RK('Rate',tspan,y0,1e-9);   %四阶微分方程的RungeKutta解法
toc

figure
subplot(2,1,1);    
plot(t,y(:,1));     
xlabel('t/s');
ylabel('{\Phi}/m^{-3}');             %光子数密度与时间关系图

subplot(2,1,2);
plot(t,y(:,2),[0 tf],[nt nt],'--r');
xlabel('t/s');
ylabel('n/m^{-3}');                   %反转粒子数与时间关系,并在图中作出阈值反转粒子数密度
sum = 0;
% 计算发光的粒子总数
for i = 1:length(y(:,2))
    if t(i) < 0.1e-5
        sum = sum + 2*y(i,2);
    end
end
fprintf('激光器的上能级状态效率：%f\n', sum/N_t);