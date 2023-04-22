% sample_impulse_step3_customize.m
% インパルス応答と単位ステップ応答の描画（グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([10],[1 2 10]);

% -------------------------------------------
options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;

% -------------------------------------------
t = 0:0.001:5;

% -------------------------------------------
options.Title.String = 'インパルス応答';

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
impulse(sysP,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 5])
ylim([-1 2.5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',-1:0.5:2.5)

% -------------------------------------------
options.Title.String = 'ステップ応答';

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
step(sysP,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 5])
ylim([0 1.4])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:1.4)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
