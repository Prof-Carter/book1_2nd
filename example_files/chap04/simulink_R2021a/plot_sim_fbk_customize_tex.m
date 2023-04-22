% plot_sim_fbk_customize_tex.m
% Simulink を利用した目標値応答と外乱応答の描画

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % 目標値 r(t) = rc = 1，外乱 d(t) = dc = 0
sim('sim_fbk')                      % Simulink モデル sim_fbk.slx の実行

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

% ---------------------------------------
rc = 0;  dc = 1;                    % 目標値 r(t) = rc = 0，外乱 d(t) = dc = 1
sim('sim_fbk')                      % Simulink モデル sim_fbk.slx の実行

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
