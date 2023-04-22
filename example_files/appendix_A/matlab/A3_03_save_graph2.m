% A3_03_save_graph2.m
% �t�^ A.3
% �O���t�̕ۑ� (2)�Fprint �𗘗p
% �@�@JPEG �t�@�C���CPNG �t�@�C���C
% �@�@PDF �t�@�C���C�g�����^�t�@�C���CEPS �t�@�C��

clc
close all
clear
format compact

disp(' ')
disp('=============================================================')
disp(' �� �O���t�̕ۑ� (2) ')
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
disp('+ JPEG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-djpeg')")
disp('+  >> % figure(2); print -djpeg graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-djpeg')
% figure(2); print -djpeg graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PNG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dpng')")
disp('+  >> % figure(2); print -dpng graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dpng')
% figure(2); print -dpng graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PDF �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dpdf')")
disp('+  >> % figure(2); print -dpdf graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dpdf')
% figure(2); print -dpdf graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �g�����^�t�@�C�� (Windows �̂�)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-dmeta')")
disp('+  >> % figure(2); print -dmeta graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-dmeta')
% figure(2); print -dmeta graph

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �J���[ EPS �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); print('graph','-depsc')")
disp('+  >> % figure(2); print -depsc graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); print('graph','-depsc')
% figure(2); print -depsc graph
