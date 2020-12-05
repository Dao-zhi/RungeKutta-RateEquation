function [ t,y ] = RK( F,tspan,y0,h )
%�Ľ�����-������
%FΪ����ĺ���,����ֵ��һά��������tspanΪ����ʱ��[t0 tf]��y0Ϊ�����ֵ����һά
%��������h��������
t0=tspan(1);        %ȡ�������ʼʱ��
tf=tspan(2);        %ȡ���������ʱ��
y=y0;               %�������ֵ����y(1,:)
k=1;                %��¼��tkʱ�̷�����ĵĽ���y�е�k��,t0ʱ��Ϊ1��
for t=t0+h:h:tf     
    K1=h*feval(F,t,y(k,:))';      
    K2=h*feval(F,t+h/2,y(k,:)+0.5*K1)';
    K3=h*feval(F,t+h/2,y(k,:)+0.5*K2)';
    K4=h*feval(F,t+h,y(k,:)+K3)';   %����K1,K2,K3,K4
    
    yt=y(k,:)+(K1+2*K2+2*K3+K4)/6;  %����tk+1ʱ�̷�����Ľ�
    y=[y;yt];   	%��yt����y�е�k+1��
    k=k+1;          %kֻ��k+1��
end
t=t0:h:tf;          %��ֵtΪ[t0,tf]
