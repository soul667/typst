% 光纤光栅参数
neff = 1.4682;              % 纤芯等效折射率
delta_n = 2e-4;             % 折射率调制强度
L = 1e-2;                   % 光栅长度
Lambda_g = 527.87e-9;       % 光栅周期
FBG_TransferMatix(neff,L,1550e-9)

%====================传输矩阵的功能函数==================================
function [f] =tansmit_fiber(L,kappa,num,n_eff,lambda,lambda_Brag)    
    delta(num)=2*pi* n_eff *(1./lambda(num)-1./lambda_Brag);
     s(num)=sqrt(kappa.^2-delta(num).^2);
    s11(num)=cosh(s(num)*L)-i*(delta(num)/s(num))*sinh(s(num)*L);%w传输矩阵元
    s12(num)=-i*(kappa/s(num))*sinh(s(num)*L);
    s21(num)=i*(kappa/s(num))*sinh(s(num)*L);
    s22(num)=cosh(s(num)*L)+i*(delta(num)/s(num))*sinh(s(num)*L);
    f=[s11(num) s12(num);s21(num) s22(num)];
    
end   
function FBG_TransferMatix(n_eff,L,lambda_Brag)
    
    %-------------变量定义-------------------------------
     
        % n_eff ----------------光栅有效折射率
        % L     ----------------光栅长度
        % lambda_Brag ----------光栅中心波长
        % kappa ----------------光波模式互耦合系数
        % delta ----------------模间失谐量
     
    %----------------------------------------------------
    disp('输入的参数如下');
    disp('光栅有效折射率为：');disp(n_eff);
    disp('布拉格光栅的中心波长为');disp(lambda_Brag);
    disp('布拉格光栅的长度为：');disp(L)
    lambda=1e-9*linspace(1308,1312,500);
    kappa_L=5;
    kappa=kappa_L/L;%交流耦合系数
    F=[1 0;0 1];
    for num=1:500
        f=tansmit_fiber(L,kappa,num,n_eff,lambda,lambda_Brag);
        f=f*F;
        r3(num)=f(2,1)/f(1,1);
        R3(num)=(abs(-r3(num)))^2;%反射率
    end
    subplot(2,1,1)
    plot(lambda*1e9,R3,'r');
    hold on
    subplot(2,1,2)
    plot(lambda*1e9,1-R3,'b')
    hold on
end