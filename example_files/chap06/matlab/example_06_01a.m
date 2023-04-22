% example_06_01a.m
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

plot(t,A*sin(w*t))
hold on
plot(t,y)
plot(t,yapp)
hold off

grid on

xlabel('t [s]')
ylabel('u(t), y(t), {y}_{app}(t)')
title('A = 1, \omega = 0.1 [rad/s]')

legend('u(t)','y(t)','{y}_{\rm app}(t)')

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

plot(t,A*sin(w*t))
hold on
plot(t,y)
plot(t,yapp)
hold off

grid on

xlabel('t [s]')
ylabel('u(t), y(t), {y}_{app}(t)')
title('A = 1, \omega = 10 [rad/s]')

legend('u(t)','y(t)','{y}_{\rm app}(t)')

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('southwest')
