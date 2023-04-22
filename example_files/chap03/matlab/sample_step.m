% sample_step.m
% �P�ʃX�e�b�v�����̕`��

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = step(sysP,t);
figure(2)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on
