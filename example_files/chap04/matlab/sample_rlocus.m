% sample_rlocus.m
% ç™ãOê’ÅFó· 4.10

close all
clear
format compact

s = tf('s');
sysPCd = 1/((s + 1)*(s + 4)*(s + 7));

figure(1); rlocus(sysPCd)