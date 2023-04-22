% sample_peakgain.m
% 共振ピーク，ピーク角周波数

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

[Mp wp] = getPeakGain(sysP,1e-5)
