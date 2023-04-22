% sample_nyquist2.m
% �x�N�g���O�Ձi�} 6.16�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

figure(1); nyquist(sysP,options);
ylim([-2.5 0.5])