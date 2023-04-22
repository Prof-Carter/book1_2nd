% exercise_06_11_03a.m
% 問題 6.11：問題 6.4 (3) のボード線図

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.11：問題 6.4 (3) のボード線図')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)^4

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

% ======================================================
% 縦軸，横軸のラベルの変更
% 横軸の範囲の変更
% 縦軸の範囲の変更

options = bodeoptions;            % ボード線図のオプション一覧
    
options.Xlabel.String = '角周波数';            % 横軸のラベル
options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル
options.XLim    = [1e-2 1e2];     % 横軸の範囲
options.YLim{1} = [-160 20];      % 縦軸の範囲（ゲイン線図）
options.YLim{2} = [-360 0];       % 縦軸の範囲（位相線図）

figure(3)
bode(sysP,options)
grid on

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
