% sample_lsim1_customize.m
% 任意の入力に対する応答の描画（グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([10],[1 2 10]);

options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = '線形シミュレーションの結果';

t = 0:0.001:5;

% -------------------------
u = t;

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
lsim(sysP,u,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 5])
ylim([0 5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.5:5)

% -------------------------
u = sin(4*t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
lsim(sysP,u,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 5])
ylim([-1.5 1.5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',-1.5:0.5:1.5)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
