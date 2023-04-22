% sample_bode3.m
% 横軸の範囲を指定したボード線図（図 6.18）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

w = logspace(-2,2,1000);
figure(1); bode(sysP,w)
grid on