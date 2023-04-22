% sample_residue2_customize.m
% 部分分数分解と時間応答（グラフをカスタマイズ）

close all
clear
format compact

numY = 2; 
denY = [1 4 4 0];
[k,p] = residue(numY,denY)

t = 0:0.01:10;
y = k(1)*exp(p(1)*t) + k(2)*t.*exp(p(2)*t) + k(3)*exp(p(3)*t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)

xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 10])
ylim([0 0.5])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.05:0.5)
