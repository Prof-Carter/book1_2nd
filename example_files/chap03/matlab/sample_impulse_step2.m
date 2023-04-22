% sample_impulse_step2.m
% インパルス応答と単位ステップ応答の描画

close all
clear
format compact

sysP = tf([10],[1 2 10]);

figure(1); impulse(sysP,5)
figure(2); step(sysP,5)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')