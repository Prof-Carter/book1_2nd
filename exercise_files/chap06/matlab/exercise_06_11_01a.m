% exercise_06_11_01a.m
% 問題 6.11：問題 6.4 (1) のボード線図

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.11：問題 6.4 (1) のボード線図')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/((s + 1)*(10*s + 1))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/((s + 1)*(10*s + 1))

% ======================================================
% 標準の設定

figure(1)
bode(sysP)
grid on

% ======================================================
% 縦軸，横軸のラベルの変更

options = bodeoptions;            % ボード線図のオプション一覧
    
options.Xlabel.String = '角周波数';            % 横軸のラベル
options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル

figure(2)
bode(sysP,options)
grid on

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
