set(0, 'DefaultAxesFontName', 'STsong');
%  设置变量 
n_eff = 1.4682;                % 光栅有效折射率
L = 1e-2;                   % 光栅长度
Lambda=527.87e-9;           % 光栅周期
lambda_Brag = 2*Lambda*n_eff;      % 光栅中心波长
disp("光栅中心波长:" + lambda_Brag);
delta_neff = 2e-4;        % 有效折射率该变量
% 波长范围从中心wang到两边
lambda = linspace(lambda_Brag-2.5e-9, lambda_Brag+2.5e-9, 100000); % 波长范围
 
[R1, R1_max] = FBGreflectivity(n_eff, L, lambda_Brag, delta_neff, lambda);
[T1, T1_max] = FBGtransmission(n_eff, L, lambda_Brag, delta_neff, lambda);
 

% 绘制图形
figure(1);
subplot(2, 1, 1);
plot(lambda, real(R1), 'b');
xlabel('波长/m');
ylabel('反射率');
title('均匀光纤布拉格光栅反射率');
subplot(2, 1, 2);
plot(lambda, real(T1), 'b');
xlabel('波长/m');
ylabel('透射率');
title('均匀光纤布拉格光栅透射率');
grid on;
 
function [R, R_max, kl] = FBGreflectivity(n_eff, L, lambda_Brag, delta_neff, lambda)
    %-------------输入变量--------------------------------
    % n_eff ---------------有效折射率
    % L -------------------栅区长度
    % lambda_Brag ---------光栅中心波长
    % delta_neff ----------折射率变化量
    % lambda --------------波长
    %-------------输出变量-------------------------------
    % R -------------------反射率
    % R_max ---------------反射率最大值
    % kl ------------------互耦合系数与栅区长度的乘积
    %----------------------------------------------------
 
    beta = (2 * pi ./ lambda) * n_eff; % 传播常数
    disp("周期:" + (lambda_Brag / (2 * n_eff)));
    delta = beta - (pi / (lambda_Brag / (2 * n_eff)));
    kappa = pi ./ lambda * delta_neff; % 互耦合系数
 
    if (kappa.^2 > delta.^2)
        s = sqrt(kappa.^2 - delta.^2);
        R = (kappa .* conj(kappa) .* sinh(s .* L).^2) ./ ((s.^2) .* cosh(s .* L).^2 + delta.^2 .* sinh(s .* L).^2);
    else
        s = sqrt(delta.^2 - kappa.^2);
        R = (kappa .* conj(kappa) .* sin(s .* L).^2) ./ ((s.^2) .* cos(s .* L).^2 + delta.^2 .* sin(s .* L).^2);
    end
 
    kl = kappa * L;
    R_max = tanh(kl);
end

function [T, T_max, kl] = FBGtransmission(n_eff, L, lambda_Brag, delta_neff, lambda)
    %-------------输入变量--------------------------------
    % n_eff ---------------有效折射率
    % L -------------------栅区长度
    % lambda_Brag ---------光栅中心波长
    % delta_neff ----------折射率变化量
    % lambda --------------波长
    %-------------输出变量-------------------------------
    % R -------------------反射率
    % R_max ---------------反射率最大值
    % kl ------------------互耦合系数与栅区长度的乘积
    %----------------------------------------------------
 
    beta = (2 * pi ./ lambda) * n_eff; % 传播常数
    disp("周期:" + (lambda_Brag / (2 * n_eff)));
    delta = beta - (pi / (lambda_Brag / (2 * n_eff)));
    kappa = pi ./ lambda * delta_neff; % 互耦合系数
 
    if (kappa.^2 > delta.^2)
        s = sqrt(kappa.^2 - delta.^2);
        T = s.^2 ./ ((s.^2) .* cosh(s .* L).^2 + delta.^2 .* sinh(s .* L).^2);
    else
        s = sqrt(delta.^2 - kappa.^2);
        T = s.^2 ./ ((s.^2) .* cos(s .* L).^2 + delta.^2 .* sin(s .* L).^2);
    end
 
    kl = kappa * L;
    T_max = tanh(kl);
end