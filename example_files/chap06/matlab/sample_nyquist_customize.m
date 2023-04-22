% sample_nyquist_customize.m
% ナイキスト軌跡（図 6.15，グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

% -----------------------
options = nyquistoptions;           % ナイキスト軌跡のオプション一覧

options.Title.FontSize     = 16;    % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;    % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;    % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;    % 軸のフォントサイズ

options.XLim = [-1 1.5];            % 横軸の範囲
options.YLim = [-2.5 2.5];          % 縦軸の範囲

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定
nyquist(sysP,options)               % ナイキスト軌跡の描画

set(gca,'XTick',-1:0.5:1.5)         % 横軸の目盛り
set(gca,'YTick',-2.5:0.5:2.5)       % 縦軸の目盛り

% -----------------------------------
h = findobj(gcf,'type','Line');     % line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)              % 線の太さを 1.5 ポイントに変更

% -----------------------------------
hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

