% 指定文件路径和文件名
set(0, 'DefaultAxesFontName', 'STsong');
set(0, 'DefaultTextFontName', 'STsong');

cd("D:\360MoveData\Users\21945\Desktop\")
filename = '实验3数据.xlsx';

% 读取第一个工作表中的所有数据
data1 = readmatrix(filename);
datax=data1(2:2002,1);
datay=data1(2:2002,3:18);

figure;
hold on;
colors = lines(size(datax, 2)); % 生成颜色
plot(datax,datay(:, 1), 'LineWidth', 2);
plot(datax,datay(:, 9), 'LineWidth', 2);
legend("应变1","应变9")
xlabel('波长', 'FontSize', 14);
ylabel('透射率', 'FontSize', 14);

title('不同应变下的透射光谱', 'FontSize', 16);
hold off;
%对datay做低通滤波
datay=lowpass(datay,0.1,1/0.1);

diff=gradient(datay(:,1))./gradient(datax);
figure;
hold on;
plot(datax,diff(:, 1), 'LineWidth', 2);
hold off;