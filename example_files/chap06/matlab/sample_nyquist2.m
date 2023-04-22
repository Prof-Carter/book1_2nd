% sample_nyquist2.m
% ベクトル軌跡（図 6.16）

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

figure(1); nyquist(sysP,options);
ylim([-2.5 0.5])