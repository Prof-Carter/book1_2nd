% exercise_07_02_02a_plot_customize.m
% 問題 7.2 (2)：開ループ伝達関数のベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 7.2 (2)：簡略化されたナイキストの安定判別法 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 　　　　　　　　　               1       ')
disp(' 制御対象の伝達関数 P(s) = ---------------')
disp(' 　　　　　　　　　        s(s + 1)(s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s*(s + 1)*(s + 2))

% -----------------------------------
for i = 1:2
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -----------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;

% -----------------------------------
w = logspace(-3,2,1000);

num = 0;
for kP = 4:2:8
    num = num + 1;
    
    sysC = kP
    sysL = sysP*sysC
    
    for i = 1:2
        figure(i)
        nyquist(sysL,w,options)

        hold on
    end
end

for i = 1:2
    figure(i)
    plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
    hold off

    h = findobj(gcf,'type','Line');
    set(h,'LineWidth',1.5)

    set(gca,'FontName','Arial')
end

% -----------------------------------
figure(1)
[~, hobj, ~, ~] = legend({'kP = 4','kP = 6','kP = 8'}, ...
                          'FontSize',16,'FontName','Arial', ...
                          'Location','southeast');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)     % legend の中の線を太く

xlim([-6 1])
ylim([-14 2])
set(gca,'XTick',-6:1:1)
set(gca,'YTick',-14:2:2)

% -----------------------------------
figure(2)
[~, hobj, ~, ~] = legend({'kP = 14','kP = 18','kP = 22'}, ...
                          'FontSize',16,'FontName','Arial', ...
                          'Location','southeast');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)     % legend の中の線を太く

xlim([-3 0.5])
ylim([-2 0.5])
set(gca,'XTick',-3:0.5:0.5)
set(gca,'YTick',-2:0.5:0.5)

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

