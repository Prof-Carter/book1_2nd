% example_07_02a_customize_tex.m
% 例 7.2：簡略化されたナイキストの安定判別法の利用例 (1)（図 7.7）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.2 ')
disp('==================================================')

Ts = tf('s');

sysP = 1/(1 + Ts);

% ------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

options.Title.FontSize     = 16;    % タイトルのフォントサイズ
options.Xlabel.FontSize    = 16;    % 横軸のラベルのフォントサイズ
options.YLabel.FontSize    = 16;    % 縦軸のラベルのフォントサイズ
options.TickLabel.FontSize = 14;    % 軸のフォントサイズ

% ------------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

for kP = [0.5 1 2]
    sysC = kP
    sysL = sysP*sysC

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

xlim([-1.2 2.2])
set(gca,'XTick',-1:0.5:2)
ylim([-1.8 0.8])
set(gca,'YTick',-2:0.5:1)

h = findobj(gcf,'type','Line');     % Line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)

[~, hobj, ~, ~] = legend({'$k\sb{\rm P} = 0.5$','$k\sb{\rm P} = 1$','$k\sb{\rm P} = 2$'}, ...
                          'Interpreter','latex','FontSize',16,'Location','southwest');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)             % legend 内の線を太く
