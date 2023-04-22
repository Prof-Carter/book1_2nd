% plot_sim_fbk_customize_tex.m
% Simulink �𗘗p�����ڕW�l�����ƊO�������̕`��

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % �ڕW�l r(t) = rc = 1�C�O�� d(t) = dc = 0
sim('sim_fbk')                      % Simulink ���f�� sim_fbk.slx �̎��s

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
title('�ڕW�l����','FontName','MS Gothic','FontSize',16)

xlim([0 10])
ylim([0 1.2])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.2:1.2)

grid on

% ---------------------------------------
rc = 0;  dc = 1;                    % �ڕW�l r(t) = rc = 0�C�O�� d(t) = dc = 1
sim('sim_fbk')                      % Simulink ���f�� sim_fbk.slx �̎��s

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
title('�O������','FontName','MS Gothic','FontSize',16)

xlim([0 10])
ylim([0 0.6])
set(gca,'XTick',0:1:10)
set(gca,'YTick',0:0.1:0.6)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
