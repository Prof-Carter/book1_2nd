% exercise_03_12_03_customize_tex.m
% 問題 3.12：問題 3.4 (4) の伝達関数に対する時間応答

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' 問題 3.12　<===　問題 3.4 (4)')
disp('==================================================')

sysP = 5/(s^2 + 2*s + 5)

% ------------------------------------------
y1 = impulse(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y1,'LineWidth',1.5)

ylim([-1 1.5])
set(gca,'YTick',-1:0.5:1.5)

% ------------------------------------------
y2 = step(sysP,t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y2,'LineWidth',1.5)

ylim([0 1.5])
set(gca,'YTick',0:0.5:1.5)

% ------------------------------------------
u  = t;
y3 = lsim(sysP,u,t);

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y3,'LineWidth',1.5)

ylim([0 8])
set(gca,'YTick',0:2:8)

% ------------------------------------------
for i = 1:3
    figure(i)
    set(gca,'FontName','Arial','FontSize',14)
    xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
    ylabel('$y(t)$','Interpreter','latex','FontSize',16)
    grid on

    xlim([0 8])
    set(gca,'XTick',0:1:8)
end

figure(1); title('Impulse response ($u(t) = \delta(t)$)','Interpreter','latex','FontSize',16)
figure(2); title('Unit step response ($u(t) = 1$)','Interpreter','latex','FontSize',16)
figure(3); title('Unit ramp response ($u(t) = t$)','Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')

