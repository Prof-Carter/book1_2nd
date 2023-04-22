% example_06_01a_customize.m
% ó· 6.1ÅFé¸îgêîâûìöÇÃï`âÊ

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ó· 6.1 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)

% ------------------------------------------------------
t = linspace(0,80,10001);
A = 1;
w = 0.1;

y = lsim(sysP,A*sin(w*t),t);

[Gg Gp] = bode(sysP,w);
Gp_rad  = Gp*pi/180;

yapp = A*Gg*sin(w*t + Gp_rad);

figure(1)
set(gcf,'Position',[100 100 900 300]) 
subplot('Position',[0.1 0.2 0.8 0.7])

plot(t,A*sin(w*t),'LineWidth',1.5)
hold on
plot(t,y,'LineWidth',1.5)
plot(t,yapp,'LineWidth',1.5)
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)

xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t), y(t), {y}_{app}(t)','FontName','Arial','FontSize',16)
title('A = 1, \omega = 0.1 [rad/s]','FontName','Arial','FontSize',16)

legend({'u(t)','y(t)','{y}_{\rm app}(t)'},'FontName','Arial','FontSize',16)

% ------------------------------------------------------
t = linspace(0,4,10001);
A = 1;
w = 10;

y = lsim(sysP,A*sin(w*t),t);

[Gg Gp] = bode(sysP,w);
Gp_rad  = Gp*pi/180;

yapp = A*Gg*sin(w*t + Gp_rad);

figure(2)
set(gcf,'Position',[100 100 900 300]) 
subplot('Position',[0.1 0.2 0.8 0.7])

plot(t,A*sin(w*t),'LineWidth',1.5)
hold on
plot(t,y,'LineWidth',1.5)
plot(t,yapp,'LineWidth',1.5)
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)

xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t), y(t), {y}_{app}(t)','FontName','Arial','FontSize',16)
title('A = 1, \omega = 10 [rad/s]','FontName','Arial','FontSize',16)

legend({'u(t)','y(t)','{y}_{\rm app}(t)'},'FontName','Arial','FontSize',16)

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('southwest')
