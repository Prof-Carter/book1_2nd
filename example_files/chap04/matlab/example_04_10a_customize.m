% example_04_10a_customize.m
% 例 4.10：根軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.10 ')
disp('==================================================')

s = tf('s');
sysP  = 1/((s + 1)*(s + 4)*(s + 7));
sysCd = 1;

sysPCd = sysP*sysCd;

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

xlim([-25 5])
ylim([-15 15])
set(gca,'XTick',-25:5:5)
set(gca,'YTick',-15:5:15)
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

t = 0:0.001:2.5;

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

for kP = [150 300 440]
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
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
title('単位ステップ応答','FontName','MS Gothic','FontSize',16)

legend({'kP = 150','kP = 300','kP = 440'},'FontName','Arial','FontSize',14)
grid on

xlim([0 2.5])
ylim([0 2])
set(gca,'XTick',0:0.5:2.5)
set(gca,'YTick',0:0.5:2)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

    