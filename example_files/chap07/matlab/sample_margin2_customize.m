% sample_margin2_customize.m
% ボード線図と安定余裕

close all
clear
format compact

sysP = tf([1],[1 1])^3;
sysC = 2;
sysL = sysP*sysC;

v = ver('MATLAB');
if v.Release < "(R2021a)"
    disp('****************************')
    disp('R2021a 以降で動作します')
    disp('****************************')
else
    % -----------------------------------
    options = bodeoptions;            % ボード線図のオプション一覧
    
    options.Xlabel.String = '角周波数';            % 横軸のラベル
    options.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル
    
    options.Title.FontSize     = 12;  % タイトルのフォントサイズ
    options.Xlabel.FontSize    = 14;  % 横軸のラベルのフォントサイズ
    options.YLabel.FontSize    = 14;  % 縦軸のラベルのフォントサイズ
    options.TickLabel.FontSize = 12;  % 軸のフォントサイズ
    
    % -----------------------------------
    figure(1)
    subplot('Position',[0.15 0.15 0.775 0.775])
    
    margin(sysL,options)
    
    h = findobj(gcf,'type','Line');   % Line という名前のオブジェクトを検索
    set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
end

