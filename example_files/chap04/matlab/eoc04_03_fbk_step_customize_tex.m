% eoc04_03_fbk_step_customize_tex.m
% �t�B�[�h�o�b�N����n�ɂ����� Gyr(s), Gyr(s), Gyr(s), Gyr(s) �̓��o��
% �ڕW�l�����C�O�������̕`��

close all
clear
format compact

sysP = tf([5],[1 2 2])
sysC = 2
sysL = minreal(sysP*sysC)

% Gyr(s), Gyr(s), Gyr(s), Gyr(s) �̓��o
sysGyr = minreal(sysL/(1 + sysL))
sysGyd = minreal(sysP/(1 + sysL))
sysGer = 1 - sysGyr
sysGed = - sysGyd

% �V�~�����[�V�������Ԃ̒�`
t = 0:0.01:10;

% �ڕW�l�����̕`��
y = step(sysGyr,t);

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

% �O�������̕`��
y = step(sysGyd,t);

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
