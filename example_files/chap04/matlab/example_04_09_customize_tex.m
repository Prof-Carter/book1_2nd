% example_04_09_customize_tex.m
% 例 4.9：根軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.9 ')
disp('==================================================')

s = tf('s');

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 P(s) = 5/(s^2 + 2s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP  = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ コントローラ C(s) = k Cd(s)')
disp('+ 　　　　　　 Cd(s) = 1, k = kP')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysCd = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s)Cd(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysPCd = sysP*sysCd

% =====================================================
% 根軌跡
% =====================================================
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
h = rlocusplot(sysPCd);

h2 = findobj(gcf,'type','Line');
n = length(h2);
for i = 1:n
    h2(i).MarkerSize = 10;
end

set(h2,'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14);
set(gca,'XColor',[0 0 0],'YColor',[0 0 0])

p = getoptions(h);
p.Title.FontSize = 16;
p.XLabel.FontSize = 16;
p.YLabel.FontSize = 16;

setoptions(h,p)

xlim([-1.6 0.2])
ylim([-5 5])
set(gca,'XTick',-1.6:0.2:0.2)
set(gca,'YTick',-5:1:5)
xtickangle(0)

% ---------------
% 古いバージョン用（R2018a など）
axis_x = findall(gcf,'String','実軸 (seconds^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (seconds^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% 最近のバージョン用
axis_x = findall(gcf,'String','実軸 (秒^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (秒^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% =====================================================
% 単位ステップ応答
% =====================================================

t = 0:0.001:5;

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

for kP = [0.5 2 5]
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    sysGyr = minreal(sysL/(1 + sysL));
    
    y = step(sysGyr,t);
    
    plot(t,y,'LineWidth',1.5)
    hold on
end

figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$ [deg]','Interpreter','latex','FontSize',16)
title('単位ステップ応答','FontName','MS Gothic','FontSize',16)

legend({'${k}_{\rm P} = 0.5$','${k}_{\rm P} = 2$','${k}_{\rm P} = 5$'}, ...
        'Interpreter','latex','FontSize',16)
grid on

xlim([0 5])
ylim([0 1.5])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:1.5)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

    