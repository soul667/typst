set(0, 'DefaultAxesFontName', 'STsong'); %不设置会乱码
cd("D:\Data\typst\PPT\MATLAB\code");
data_path = "../data";
data_path_list = [];

x = zeros(2001,15);
y = zeros(2001,15);


legend_list={};  % 图例使用

% help zeros;
% help lengend;

legend_=[];
for i = 1:15
    if i < 10
        add_ = "/W000";
    else
        add_ = "/W00";
    end
    data_path_ = data_path + (add_) + num2str(i) + ".CSV";
    data1 = readmatrix(data_path_);
    use_=(data1(23:2023, 1));
    x(:,i) = ((data1(23:2023, 1)));
    y(:,i) =((data1(23:2023, 2)));
    legend_list{i} = ((add_) + num2str(i));
   % legend_.append((add_) + num2str(i));
    disp(((add_) + num2str(i)));

end
figure;
hold on;

for i=1:15
    colors = lines(size(x, 2)); % 生成颜色
    plot(x(:,i),y(:,i), 'LineWidth', 2);
    % plot(x_,y_, 'LineWidth', 2);
    xlabel('波长', 'FontSize', 14);
    ylabel('透射率', 'FontSize', 14);
    
    title('不同应变下的透射光谱', 'FontSize', 16);
end
legend(legend_list);
% legend("001","002","003","004","005","006","007","008","009","010","011","012","013","014","015");

hold off;

