function dy= Rate( t,y )
%连续激光器耦合速率方程组
%   
global c sigma l l_t t_r gamma N_t tao_a Rp epsilon       %引用全局变量

y(1)=max(y(1),1);                                         %由于自发辐射存在，光子数密度始终大于1
dy=[y(1)*(y(2)*c*sigma*l/l_t-epsilon/t_r);                %光子数密度
    -gamma*y(2)*y(1)*sigma*c-(y(2)+N_t*(gamma-1))/tao_a+Rp/N_t*(N_t-y(2))];
                                                          %反转粒子数密度
end

