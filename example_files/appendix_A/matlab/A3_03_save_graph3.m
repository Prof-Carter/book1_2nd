% A3_03_save_graph3.m
% 付録 A.3
% グラフの保存 (3)：exportgraphics を利用（R2020a 以降）
% 　　JPEG ファイル，PNG ファイル，
% 　　PDF ファイル，拡張メタファイル，EPS ファイル

clc
close all
clear
format compact

disp(' ')
disp('=============================================================')
disp(' ■ グラフの保存 (3) ')
disp('=============================================================')

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> x = -5:0.1:5;')
disp('+  >> y = x.^2 - 2*x - 5;')
disp('+  >> figure(2)')
disp("+  >> plot(x,y,'r--','LineWidth',2)")
disp("+  >> set(gca,'FontSize',16,'FontName','Arial')")
disp("+  >> xlim([-4 4]); set(gca,'XTick',-4:1:4)")
disp("+  >> ylim([-10 20]); set(gca,'YTick',-10:5:20)")
disp("+  >> xlabel('x','FontSize',18,'FontName','Arial')")
disp("+  >> ylabel('y','FontSize',18,'FontName','Arial')")
disp('+  >> grid on')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

x = -5:0.1:5;
y = x.^2 - 2*x - 5;
figure(2)
plot(x,y,'r--','LineWidth',2)
set(gca,'FontSize',16,'FontName','Arial')
xlim([-4 4]); set(gca,'XTick',-4:1:4)
ylim([-10 20]); set(gca,'YTick',-10:5:20)
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
grid on

disp(' ')
disp('=============================================================')
disp('exportgraphics は R2020a 以降で動作します')
disp('=============================================================')

v = ver('MATLAB')

if v.Release < "(R2020a)"
    disp(' ')
    disp('***********************************************')
    disp('使用しているバージョンが R2020a 以降ではありません')
    disp('***********************************************')
else
    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ JPEG ファイル')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.jpg'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.jpg')
    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ PNG ファイル')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.png'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.png')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ PDF ファイル')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.pdf'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.pdf')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ 拡張メタファイル (Windows のみ)')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.emf'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.emf')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ カラー EPS ファイル')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.eps'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.eps')
end

