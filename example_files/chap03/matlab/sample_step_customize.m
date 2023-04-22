% sample_step_customize.m
% 単位ステップ応答の描画（グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = step(sysP,t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 5])
ylim([0 1.4])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:1.4)

