% exercise_06_11_01a_customize.m
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

% ------------------------------------------------------
options = bodeoptions;            % ボード線図のオプション一覧

options.Xlabel.String = '角周波数';            % 横軸のラベル
options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル

options.Title.FontSize     = 16;  % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;  % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;  % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;  % 軸のフォントサイズ

options.Grid    = 'on';           % 補助線の表示

options.XLim    = [1e-3 1e2];     % 横軸の範囲
options.YLim{1} = [-110 10];      % 縦軸の範囲（ゲイン線図）
options.YLim{2} = [-200 20];      % 縦軸の範囲（位相線図）

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定

bode(sysP,options)
grid on

h = findobj(gcf,'type','Line');   % line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更

