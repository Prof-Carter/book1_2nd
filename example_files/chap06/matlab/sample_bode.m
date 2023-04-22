% sample_bode.m
% ボード線図（図 6.17）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])
figure(1); bode(sysP)
grid on