% sample_nyquist.m
% �i�C�L�X�g�O�Ձi�} 6.15�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);
figure(1);  nyquist(sysP)