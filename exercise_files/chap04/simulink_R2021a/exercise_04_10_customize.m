% exercise_04_10_customize.m
% Simulink を利用した目標値応答と外乱応答の描画

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % 目標値 r(t) = rc = 1，外乱 d(t) = dc = 0
sim('exercise_04_10_sim_fbk')       % Simulink モデル exercise_04_10_sim_fbk.slx の実行

figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
title('r(t) = 1, d(t) = 0','FontName','Arial','FontSize',16)

xlim([0 10])
ylim([0 1.5])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.5:1.5)

grid on

% ---------------------------------------
rc = 0;  dc = 1;                    % 目標値 r(t) = rc = 0，外乱 d(t) = dc = 1
sim('exercise_04_10_sim_fbk')       % Simulink モデル exercise_04_10_sim_fbk.slx の実行

figure(2)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
title('r(t) = 0, d(t) = 1','FontName','Arial','FontSize',16)

xlim([0 10])
ylim([-0.25 0.75])
set(gca,'XTick',0:1:10)
set(gca,'YTick',-0.25:0.25:0.75)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
