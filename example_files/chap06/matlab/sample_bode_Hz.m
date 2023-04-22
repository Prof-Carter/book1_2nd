% sample_bode_Hz.m
% 横軸を周波数 f [Hz] としたボード線図（図 6.19）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

opts = bodeoptions;
opts.FreqUnits  = 'Hz';

figure(1); bode(sysP,opts)
grid on