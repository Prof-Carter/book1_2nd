% sample_bode2.m
% �����͈̔͂��w�肵���{�[�h���}�i�} 6.18�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

figure(1); bode(sysP,{1e-2,1e2})
grid on