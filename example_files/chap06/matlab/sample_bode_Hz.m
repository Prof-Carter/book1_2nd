% sample_bode_Hz.m
% ���������g�� f [Hz] �Ƃ����{�[�h���}�i�} 6.19�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

opts = bodeoptions;
opts.FreqUnits  = 'Hz';

figure(1); bode(sysP,opts)
grid on