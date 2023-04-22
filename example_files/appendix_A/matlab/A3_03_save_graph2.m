% A3_03_save_graph2.m
% 付録 A.3
% グラフの保存 (2)：print を利用
% 　　JPEG ファイル，PNG ファイル，
% 　　PDF ファイル，拡張メタファイル，EPS ファイル

clc
close all
clear
format compact

disp(' ')
disp('=============================================================')
disp(' ■ グラフの保存 (2) ')
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
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ JPEG ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-djpeg')")
disp('+  >> % figure(2); print -djpeg graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-djpeg')
% figure(2); print -djpeg graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PNG ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dpng')")
disp('+  >> % figure(2); print -dpng graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dpng')
% figure(2); print -dpng graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PDF ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dpdf')")
disp('+  >> % figure(2); print -dpdf graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dpdf')
% figure(2); print -dpdf graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 拡張メタファイル (Windows のみ)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dmeta')")
disp('+  >> % figure(2); print -dmeta graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dmeta')
% figure(2); print -dmeta graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ カラー EPS ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-depsc')")
disp('+  >> % figure(2); print -depsc graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-depsc')
% figure(2); print -depsc graph
