% eoc04_03_fbk_step_customize_tex.m
% フィードバック制御系における Gyr(s), Gyr(s), Gyr(s), Gyr(s) の導出と
% 目標値応答，外乱応答の描画

close all
clear
format compact

sysP = tf([5],[1 2 2])
sysC = 2
sysL = minreal(sysP*sysC)

% Gyr(s), Gyr(s), Gyr(s), Gyr(s) の導出
sysGyr = minreal(sysL/(1 + sysL))
sysGyd = minreal(sysP/(1 + sysL))
sysGer = 1 - sysGyr
sysGed = - sysGyd

% シミュレーション時間の定義
t = 0:0.01:10;

% 目標値応答の描画
y = step(sysGyr,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
title('目標値応答','FontName','MS Gothic','FontSize',16)

xlim([0 10])
ylim([0 1.2])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.2:1.2)

grid on

% 外乱応答の描画
y = step(sysGyd,t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
title('外乱応答','FontName','MS Gothic','FontSize',16)

xlim([0 10])
ylim([0 0.6])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.1:0.6)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
