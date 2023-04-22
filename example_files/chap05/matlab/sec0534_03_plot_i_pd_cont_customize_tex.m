% sec0534_03_plot_i_pd_cont.m
% 鉛直面を回転するアームの I-PD 制御の目標値応答と外乱応答
% （グラフのカスタマイズ）

close all
clear
format compact

arm_para

a0 = M*g*l/J;
a1 = c/J;
b0 = 1/J;

s = tf('s');

sysP = b0/(s^2 + a1*s + a0)

t = 0:0.001:2;

% -------------------------------------------
wm = 10;
alpha1 = 2;
alpha2 = 2;

kI = wm^3/b0;
kP = (alpha1*wm^2 - a0)/b0;
kD = (alpha2*wm - a1)/b0;

fprintf('\n++++++++++++++++++++++++++++\n')
fprintf('目標値応答に注目した I-PD 制御')
fprintf('外乱応答に注目した PI-D 制御')
fprintf('\n++++++++++++++++++++++++++++\n')
fprintf('\t wm = %3.2e\n',wm)
fprintf('\t alpha1 = %3.2e\n',alpha1)
fprintf('\t ---------------------\n')
fprintf('\t kI = %3.2e\n',kI)
fprintf('\t kP = %3.2e\n',kP)
fprintf('\t kD = %3.2e\n',kD)

% -------------------------------------------
% 目標値応答に注目した I-PD 制御
% -------------------------------------------
sysC1  = kP + kI/s + kD*s;
sysC3  =      kI/s;

sysPC1 = minreal(sysP*sysC1);
sysPC3 = minreal(sysP*sysC3);

sysGyr = minreal(sysPC3/(1 + sysPC1))
sysGyd = minreal(sysP  /(1 + sysPC1))

y1 = step(sysGyr,t);
y2 = step(sysGyd,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y1,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
hold on

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y2,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
hold on

% -------------------------------------------
% 外乱応答に注目した PI-D 制御
% -------------------------------------------
sysC2  = kP + kI/s;

sysPC2 = minreal(sysP*sysC2);

sysGyr = minreal(sysPC2/(1 + sysPC1))
sysGyd = minreal(sysP  /(1 + sysPC1))

y1 = step(sysGyr,t);
y2 = step(sysGyd,t);

figure(1)
plot(t,y1,'--','LineWidth',1.5)

figure(2)
plot(t,y2,'--','LineWidth',1.5)

% -------------------------------------------
figure(1)
plot([0 t(end)],[1 1],'k')
hold off
grid on

set(gca,'XTick',0:0.5:2)
ylim([0 1.5])
set(gca,'YTick',0:0.25:1.5)

xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$ [rad]','Interpreter','latex','FontSize',16)
title('$r(t) = 1$, $d(t) = 0$','Interpreter','latex','FontSize',16)

legend('I-PD control', 'PI-D control')
set(legend,'FontName','Arial','FontSize',14)

% -----
figure(2)
hold off
grid on

set(gca,'XTick',0:0.5:2)
ylim([-0.1 0.2])
set(gca,'YTick',-0.1:0.05:0.2)

xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$ [rad]','Interpreter','latex','FontSize',16)
title('$r(t) = 0$, $d(t) = 1$','Interpreter','latex','FontSize',16)

legend('I-PD control', 'PI-D control')
set(legend,'FontName','Arial','FontSize',14)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')


