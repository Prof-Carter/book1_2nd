% sample_lsim2.m
% ”CˆÓ‚Ì“ü—Í‚É‘Î‚·‚é‰ž“š‚Ì•`‰æ

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

u1 = t;
y1 = lsim(sysP,u1,t);
figure(1)
plot(t,u1,'--',t,y1)
xlabel('t [s]')
ylabel('u(t) and y(t)')
legend('u(t)','y(t)')
grid on

u2 = sin(4*t);
y2 = lsim(sysP,u2,t);
figure(2)
plot(t,u2,'--',t,y2)
xlabel('t [s]')
ylabel('u(t) and y(t)')
legend('u(t)','y(t)')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')