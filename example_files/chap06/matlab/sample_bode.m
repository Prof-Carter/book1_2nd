% sample_bode.m
% �{�[�h���}�i�} 6.17�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1])
figure(1); bode(sysP)
grid on