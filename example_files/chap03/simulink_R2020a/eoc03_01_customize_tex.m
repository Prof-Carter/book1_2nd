% eoc03_01_customize_tex.m
% Simulink モデルを利用した単位ステップ応答の描画：例 3.13
% （Simulink ブロック To Workspace のデータを利用）

close all
clear
format compact

sim('sim_step')

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)

xlim([0 5])
ylim([0 1.4])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:1.4)