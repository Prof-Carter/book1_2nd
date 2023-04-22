% exercise_06_10.m
% 問題 6.10：問題 6.4 (3) のナイキスト軌跡とベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.10 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 伝達関数 P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

sysP = 1/(s + 1)^4

w = logspace(-3,3,10000);

%  ----- ナイキスト軌跡の描画 -----------------------------

figure(1)
nyquist(sysP,w)

%  ----- ベクトル軌跡の描画 -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

figure(2)
nyquist(sysP,w,options)

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')



