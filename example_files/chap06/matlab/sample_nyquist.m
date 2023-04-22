% sample_nyquist.m
% ナイキスト軌跡（図 6.15）

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);
figure(1);  nyquist(sysP)