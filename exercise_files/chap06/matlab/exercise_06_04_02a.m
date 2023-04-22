% exercise_06_04_02.m
% 問題 6.4 (2)：ベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.4 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 伝達関数 P(s) = exp(-L*s)/(T*s + 1)')
disp(' 　　　　    L = 1, T = 0.2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

L = 1
T = 0.2

sysP = exp(-L*s)/(T*s + 1)

%  ----- ベクトル軌跡の描画 -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

w = logspace(-2,2,10000);

figure(1)
nyquist(sysP,w,options)

