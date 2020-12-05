clear;
global c sigma l l_t t_r gamma N_t tao_a Rp epsilon %����ȫ�ֱ���

c=3e8;                              %����й��� (m/s)
sigma=6.5e-23;                      %�ܼ�������� (m^2)
l=0.16;                             %������ʳ��� (m)
l_t=0.69;                           %��������ǻ�� (m)
R=0.4;                              %�����������
L=0.1;                              %��ɢ���
epsilon=-log(R)+L;                  %���������
t_r=2*l_t/c;                        %ǻ������ʱ�� (s)
gamma=1;                            %��ת����
N_t=1.38e26;                        %�������� (m^-3)
tao_a = 230e-6;                     %������ʵ����ܼ�����(s)
Rp=1e29;                            %�������� (1/(s*m^-3))
nt=1/(2*sigma*l)*(epsilon);         %��ֵ��ת�������ܶ� (m^-3)

tf=0.000008*2;                      %�����ֹʱ��
y0=[1 0];                           %������ʷ������ֵ.�����Է�����������ܶȳ�ֵΪ1
tspan=[0 tf];                       %����ʱ��
tic
%[t,y] = ode45('Rate',tspan,y0);     %����Runge-Kutta�������ʷ�����Rate
[t,y] = RK('Rate',tspan,y0,1e-9);   %�Ľ�΢�ַ��̵�RungeKutta�ⷨ
toc

figure
subplot(2,1,1);    
plot(t,y(:,1));     
xlabel('t/s');
ylabel('{\Phi}/m^{-3}');             %�������ܶ���ʱ���ϵͼ

subplot(2,1,2);
plot(t,y(:,2),[0 tf],[nt nt],'--r');
xlabel('t/s');
ylabel('n/m^{-3}');                   %��ת��������ʱ���ϵ,����ͼ��������ֵ��ת�������ܶ�
sum = 0;
% ���㷢�����������
for i = 1:length(y(:,2))
    if t(i) < 0.1e-5
        sum = sum + 2*y(i,2);
    end
end
fprintf('�����������ܼ�״̬Ч�ʣ�%f\n', sum/N_t);