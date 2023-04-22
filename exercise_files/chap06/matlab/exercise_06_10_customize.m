% exercise_06_10_customize.m
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

%  ----- 描画のオプション設定 -----------------------------

options = nyquistoptions;          % ナイキスト軌跡のオプション一覧

options.Title.FontSize     = 16;   % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;   % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;   % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;   % 軸のフォントサイズ

%  ----- ナイキスト軌跡の描画 -----------------------------

options.XLim = [-1.2 1.2];         % 横軸の範囲
options.YLim = [-1 1];             % 縦軸の範囲

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) 
nyquist(sysP,w,options)

h = findobj(gcf,'type','Line');   % Line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

%  ----- ベクトル軌跡の描画 -----------------------------

options.ShowFullContour = 'off';       % 負の角周波数に対する軌跡を描画しない
options.Title.String = 'ベクトル軌跡';  % タイトルを「ベクトル軌跡」に変更

options.XLim = [-1.2 1.2];         % 横軸の範囲
options.YLim = [-1.5 0.5];         % 縦軸の範囲

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775]) 

nyquist(sysP,w,options)            % ベクトル軌跡の描画

h = findobj(gcf,'type','Line');    % Line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)             % 線の太さを 1.5 ポイントに変更

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

