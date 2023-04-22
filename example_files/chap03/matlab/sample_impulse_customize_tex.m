% sample_impulse_customize_tex.m
% インパルス応答の描画（グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = impulse(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
grid on

xlim([0 5])
ylim([-1 2.5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',-1:0.5:2.5)
