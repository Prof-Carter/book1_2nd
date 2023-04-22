% sec0631_03_customize_tex.m
% ローパスフィルタ：1 次遅れ要素によるノイズ除去（図 6.8）

close all
clear
format compact

sim('sim_noise_reduction')

% --------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
title('低周波信号','FontName','MS UI Gothic','FontSize',16)

% --------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,n,'LineWidth',1.5)
ylabel('$n(t)$','Interpreter','latex','FontSize',16)
title('ノイズ（高周波信号）','FontName','MS UI Gothic','FontSize',16)

% --------------------------------
figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y+n,'LineWidth',1.5)

ylabel('$y(t) + n(t)$','Interpreter','latex','FontSize',16)
title('低周波信号 + ノイズ','FontName','MS UI Gothic','FontSize',16)

% --------------------------------
figure(4)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y+n,'LineWidth',1.5)
hold on
plot(t,yf,'LineWidth',1.5)
hold off
ylabel('${y}_{\rm f}(t)$','Interpreter','latex','FontSize',16)
title('ローパスフィルタ通過後の信号','FontName','MS UI Gothic','FontSize',16)

legend({'$y(t) + n(t)$','${y}_{\rm f}(t)$'},...
    'Interpreter','latex','FontSize',16)

% --------------------------------
for i = 1:4
    figure(i)
    grid on

    ylim([-1.5 1.5])
    xlim([0 2*pi])

    xlabel('$t$ [s]','Interpreter','latex','FontSize',16)

    set(gca,'XTick',0:pi/4:2*pi)
    set(gca,'XTickLabel',{'$0$','','$\pi/2$','','$\pi$','','$3\pi/2$','','$2\pi$'})
    set(gca,'TickLabelInterpreter','latex','FontSize',14)
    set(gca,'XTickLabelRotation',0)
end

figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


