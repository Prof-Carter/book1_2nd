% sample_bode2.m
% 横軸の範囲を指定したボード線図（図 6.18）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

figure(1); bode(sysP,{1e-2,1e2})
grid on