% sample_margin2.m
% ボード線図と安定余裕

close all
clear
format compact

sysP = tf([1],[1 1])^3;
sysC = 2;
sysL = sysP*sysC;

figure(1); margin(sysL)
