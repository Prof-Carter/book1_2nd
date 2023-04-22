% sample_impulse_step_multi3_customize.m
% 複数のシステムのインパルス応答と単位ステップ応答の描画

close all
clear
format compact

sysP1 = tf([4 5],[1 2 5]);
sysP2 = tf([1],[1 1]);

% -------------------------------------------
options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;

% -------------------------------------------
t = 0:0.001:10;

% -------------------------------------------
options.Title.String = 'インパルス応答';

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
impulse(sysP1,sysP2,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 10])
ylim([-1 4])
set(gca,'XTick',0:1:10)
set(gca,'YTick',-1:0.5:4)

% -------------------------------------------
options.Title.String = 'ステップ応答';

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
step(sysP1,sysP2,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([0 10])
ylim([0 1.8])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.2:1.8)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')