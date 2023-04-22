% sample_frequency_response.m
% 周波数応答（図 6.21，グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])
A = 1;  w = 2;
t = 0:0.001:25;

[Gg Gp] = bode(sysP,w);
Gp_rad = Gp*pi/180;

u = A*sin(w*t);
y = lsim(sysP,u,t);
yapp = A*Gg*sin(w*t + Gp_rad);

figure(1);  plot(t,u)
ylim([-1.5 1.5])
xlabel('t [s]');  ylabel('u(t)')
legend('u(t)');  grid on

figure(2);  plot(t,yapp,t,y,'--')
ylim([-0.8 0.8])
xlabel('t [s]');  ylabel('y(t) and {y}_{app}(t)')
legend('{y}_{app}(t)','y(t)');  grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')