% sample_impulse_multi.m
% 複数のシステムのインパルス応答の描画

close all
clear
format compact

sysP1 = tf([4 5],[1 2 5]);
sysP2 = tf([1],[1 1]);

t = 0:0.001:10;
y1 = impulse(sysP1,t);
y2 = impulse(sysP2,t);

figure(1); plot(t,y1,t,y2)
xlabel('t [s]')
ylabel('y1(t) and y2(t)')
legend('y1(t)','y2(t)')
grid on
