clc; clear; 
% 定义参数
lambda = 500e-9; % 入射光波长，单位：米
f = 0.2; % 透镜焦距，单位：米
D = 0.5e-3; % 圆孔半径，单位：米
k = 2 * pi / lambda; % 波数


% f=0.2;
% D=1e-3;
% a=500e-9;
r=1.22*f*lambda/D;
theta=r/f;
disp(r+" "+theta);
