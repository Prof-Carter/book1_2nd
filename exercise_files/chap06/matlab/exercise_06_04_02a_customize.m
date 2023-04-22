% exercise_06_04_02_customize.m
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
options = nyquistoptions;          % ナイキスト軌跡のオプション一覧

options.Title.FontSize     = 16;   % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;   % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;   % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;   % 軸のフォントサイズ

options.XLim = [-1.2 1.2];         % 横軸の範囲
options.YLim = [-1.2 1.2];         % 縦軸の範囲

options.ShowFullContour = 'off';       % 負の角周波数に対する軌跡を描画しない
options.Title.String = 'ベクトル軌跡';  % タイトルを「ベクトル軌跡」に変更

% -----------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定

w = logspace(-2,2,10000);

nyquist(sysP,w,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off



