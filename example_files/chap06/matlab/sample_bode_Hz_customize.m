% sample_bode_Hz_customize.m
% 横軸を周波数 f [Hz] としたボード線図（図 6.19）

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

% -----------------------------------
options = bodeoptions;            % ボード線図のオプション一覧

options.FreqUnits     = 'Hz';     % 横軸の単位を rad/s から Hz に変更

options.Xlabel.String = '周波数';              % 横軸のラベル
options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル

options.Title.FontSize     = 16;  % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;  % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;  % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;  % 軸のフォントサイズ

options.Grid    = 'on';           % 補助線の表示

options.XLim{1} = [1e-2 1e1];     % 横軸の範囲
options.YLim{1} = [-80 20];       % 縦軸の範囲（ゲイン線図）
options.YLim{2} = [-180 0];       % 縦軸の範囲（位相線図）

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定
bode(sysP,options);               % ボード線図の描画

% -----------------------------------
h = findobj(gcf,'type','Line');   % line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
