function dy= Rate( t,y )
%����������������ʷ�����
%   
global c sigma l l_t t_r gamma N_t tao_a Rp epsilon       %����ȫ�ֱ���

y(1)=max(y(1),1);                                         %�����Է�������ڣ��������ܶ�ʼ�մ���1
dy=[y(1)*(y(2)*c*sigma*l/l_t-epsilon/t_r);                %�������ܶ�
    -gamma*y(2)*y(1)*sigma*c-(y(2)+N_t*(gamma-1))/tao_a+Rp/N_t*(N_t-y(2))];
                                                          %��ת�������ܶ�
end

