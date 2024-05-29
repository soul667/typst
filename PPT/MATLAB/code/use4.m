% π相移参数
phi = pi;

% 重新计算反射率和透射率
gamma_L = gamma * L/2;
reflectivity_shift = (sin(gamma_L).^4) ./ (cos(gamma_L).^2 + sinh(gamma_L).^2);
transmission_shift = 1 - reflectivity_shift;

% 绘图
figure;
plot(lambda*1e9, reflectivity_shift, 'b', 'LineWidth', 2);
xlabel('Wavelength (nm)');
ylabel('Reflectivity');
title('Reflection Spectrum of π-shifted FBG');

figure;
plot(lambda*1e9, transmission_shift, 'r', 'LineWidth', 2);
xlabel('Wavelength (nm)');
ylabel('Transmission');
title('Transmission Spectrum of π-shifted FBG');
