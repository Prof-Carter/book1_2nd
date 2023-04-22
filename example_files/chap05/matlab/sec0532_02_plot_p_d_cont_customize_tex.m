% sec0532_02_plot_p_d_cont_customize.m
% 鉛直面を回転するアームの P-D 制御の目標値応答と外乱応答
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

wm = 10;
zetam = 0.7;

kP = (wm^2 - a0)/b0;

for i = 1:2
    if i == 1
        kD = 0;
        fprintf('\n++++++++++++++++++++++++++++\n')
        fprintf('P 制御\n')
        fprintf('\t ---------------------\n')
        fprintf('\t wm = %3.2e\n',wm)
        fprintf('\t ---------------------\n')
        fprintf('\t kP = %3.2e\n',kP)
        fprintf('\t kD = %3.2e\n',kD)
    elseif i == 2
        kD = (2*zetam*wm - a1)/b0;
        fprintf('\n++++++++++++++++++++++++++++\n')
        fprintf('P-D 制御\n')
        fprintf('\t ---------------------\n')
        fprintf('\t wm = %3.2e\n',wm)
        fprintf('\t ---------------------\n')
        fprintf('\t kP = %3.2e\n',kP)
        fprintf('\t kD = %3.2e\n',kD)
    end

    sysC1  = kP + kD*s;
    sysC2  = kP;
    sysPC1 = minreal(sysP*sysC1);
    sysPC2 = minreal(sysP*sysC2);

    sysGyr = minreal(sysPC2/(1 + sysPC1))
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
end

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

legend('P control', 'P-D control')
set(legend,'FontName','Arial','FontSize',14)

% -------------------------------------------
figure(2)
hold off
grid on

set(gca,'XTick',0:0.5:2)
ylim([0 0.3])
set(gca,'YTick',0:0.05:0.3)

xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$ [rad]','Interpreter','latex','FontSize',16)
title('$r(t) = 0$, $d(t) = 1$','Interpreter','latex','FontSize',16)

legend('P control', 'P-D control')
set(legend,'FontName','Arial','FontSize',14)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
