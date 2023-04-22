% example_07_01a_customize.m
% 例 7.1：ナイキストの安定判別法（図 7.4）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.1 ')
disp('==================================================')

% -----------------------------------
options = nyquistoptions;           % ナイキスト軌跡のオプション一覧

options.Title.FontSize     = 16;    % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;    % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;    % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;    % 軸のフォントサイズ

options.XLim = [-2 0.5];            % 横軸の範囲
options.YLim = [-1 1];              % 縦軸の範囲

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s - 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s - 1)

% ------------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % グラフの描画位置の設定

for kP = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' C(s) = kP ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysC = kP
    
    disp(' ')
    disp('--------------------------------------------------')
    disp(' =====> L(s) = P(s)C(s)')
    disp('--------------------------------------------------')
    
    sysL = sysP*sysC

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

h = findobj(gcf,'type','Line');     % Line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)

[~, hobj, ~, ~] = legend({'kP = 0.5','kP = 1','kP = 2'}, ...
                          'FontSize',14,'FontName','Arial');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)             % legend 内の線を太く


