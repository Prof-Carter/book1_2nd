% sample_bode3.m
% �����͈̔͂��w�肵���{�[�h���}�i�} 6.18�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

w = logspace(-2,2,1000);
figure(1); bode(sysP,w)
grid on