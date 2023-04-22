% sample_bode_customize.m
% ボード線図（図 6.17，グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

% -----------------------------------
options = bodeoptions;            % ボード線図のオプション一覧

options.Xlabel.String = '角周波数';            % 横軸のラベル
options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル

options.Title.FontSize     = 16;  % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;  % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;  % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;  % 軸のフォントサイズ

options.Grid    = 'on';           % 補助線の表示

options.XLim    = [1e-1 1e1];     % 横軸の範囲
options.YLim{1} = [-40 10];       % 縦軸の範囲（ゲイン線図）
options.YLim{2} = [-180 0];       % 縦軸の範囲（位相線図）

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定

bode(sysP,options);               % ボード線図の描画

% -----------------------------------
h = findobj(gcf,'type','Line');   % line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
