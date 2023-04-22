% exercise_06_04_01a.m
% 問題 6.4 (1)：ベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.4 (1) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 伝達関数 P(s) = exp(-L*s), L = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

L = 1

sysP = exp(-L*s)

%  ----- ベクトル軌跡の描画 -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

w = logspace(-2,2,10000);

figure(1)
nyquist(sysP,w,options)




