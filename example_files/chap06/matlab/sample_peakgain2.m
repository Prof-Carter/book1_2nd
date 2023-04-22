% sample_peakgain2.m
% 共振ピーク，ピーク角周波数

close all
clear
format compact

zeta = 0.25; wn = 1;

wp = wn*sqrt(1 - 2*zeta^2)
Mp = 1/(2*zeta*sqrt(1 - zeta^2))