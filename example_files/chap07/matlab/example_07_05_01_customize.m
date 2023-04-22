% example_07_05_01_customize.m
% 例 7.5：ボード線図と安定余裕（図 7.16）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.5 ')
disp('==================================================')

s = tf('s');
sysP = 1/(s + 1)^3;

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
    
    options.XLim    = [1e-1 1e1];     % 横軸の範囲
    options.YLim{1} = [-40 40];       % 縦軸の範囲（ゲイン線図）
    options.YLim{2} = [-270 0];       % 縦軸の範囲（位相線図）
    
    % -----------------------------------
    for num = 1:3
        figure(num)
        subplot('Position',[0.15 0.15 0.775 0.775])
    end
    
    % -----------------------------------
    num = 0;
    for kP = [2 8 20]
        num = num + 1;
    
        figure(num)
        sysL = minreal(sysP*kP);
    
        margin(sysL,options);
    end
    
    % -----------------------------------
    for num = 1:3
        figure(num)
        h = findobj(gcf,'type','Line');   % Line という名前のオブジェクトを検索
        set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
    end
    
    % -----------------------------------
    figure(1); movegui('northwest')
    figure(2); movegui('north')
    figure(3); movegui('northeast')
end