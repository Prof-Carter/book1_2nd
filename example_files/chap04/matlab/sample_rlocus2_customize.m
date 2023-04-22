% sample_rlocus2_customize.m
% 根軌跡：例 4.10（グラフのカスタマイズ）

close all
clear
format compact

s = tf('s');
sysPCd = 1/((s + 1)*(s + 4)*(s + 7));

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
h = rlocusplot(sysPCd);

h2 = findobj(gcf,'type','Line');
n = length(h2);
for i = 1:n
    h2(i).MarkerSize = 10;
end

set(h2,'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
set(gca,'XColor',[0 0 0],'YColor',[0 0 0])

p = getoptions(h);
p.Title.FontSize = 16;
p.XLabel.FontSize = 16;
p.YLabel.FontSize = 16;

setoptions(h,p)

% 最近のバージョン用
axis_x = findall(gcf,'String','実軸 (秒^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (秒^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');

% 古いバージョン用 (R2018a など）
axis_x = findall(gcf,'String','実軸 (seconds^{-1})'); % すべてのグラフィックスオブジェクトから文字列を検索
axis_y = findall(gcf,'String','虚軸 (seconds^{-1})');
set(axis_x,'String','実軸'); % 文字列を再定義
set(axis_y,'String','虚軸');
