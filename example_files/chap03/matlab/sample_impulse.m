% sample_impulse.m
% インパルス応答の描画

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = impulse(sysP,t);
figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on
