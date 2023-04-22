% sample_impulse_multi_customize.m
% 複数のシステムのインパルス応答の描画

close all
clear
format compact

sysP1 = tf([4 5],[1 2 5]);
sysP2 = tf([1],[1 1]);

t = 0:0.001:10;
y1 = impulse(sysP1,t);
y2 = impulse(sysP2,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y1,t,y2,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y1(t) and y2(t)','FontName','Arial','FontSize',16)
legend({'y1(t)','y2(t)'},'FontName','Arial','FontSize',14)
grid on

xlim([0 10])
ylim([-1 4])
set(gca,'XTick',0:1:10)
set(gca,'YTick',-1:0.5:4)
