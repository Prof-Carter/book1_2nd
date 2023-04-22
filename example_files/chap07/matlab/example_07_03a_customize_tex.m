% example_07_03a_customize_tex.m
% 例 7.3：簡略化されたナイキストの安定判別法の利用例 (2)（図 7.8）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.3 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^3 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)^3

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

w = logspace(-3,2,1000);

for kP = [4 8 16]
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

    nyquist(sysL,w,options)
    hold on
end

figure(1)
hold off

xlim([-4 16])
set(gca,'XTick',-4:2:16)
ylim([-12 2])
set(gca,'YTick',-12:2:2)

h = findobj(gcf,'type','Line');     % Line という名前のオブジェクトを検索
set(h,'LineWidth',1.5)

[~, hobj, ~, ~] = legend({'$k\sb{\rm P} = 4$','$k\sb{\rm P} = 8$','$k\sb{\rm P} = 16$'}, ...
                          'Interpreter','latex','FontSize',16);
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)             % legend 内の線を太く
