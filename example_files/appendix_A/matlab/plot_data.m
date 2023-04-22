% plot_data.m
% M ファイル

close all

clear                   % メモリの初期化
format compact          % 余分な改行の抑制
x = -5:0.1:5;           % 横軸データ
y = x.^2 - 2*x - 5;     % 縦軸データ
figure(2)
plot(x,y,'r--','LineWidth',2)
set(gca,'FontSize',16,'FontName','Arial')
xlim([-4 4]); set(gca,'XTick',-4:1:4)
ylim([-10 20]); set(gca,'YTick',-10:5:20)
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
grid on