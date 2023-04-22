% A3_03_save_graph1.m
% �t�^ A.3
% �O���t�̕ۑ� (1)�Ffig �t�@�C���̕ۑ�

clc
close all
clear
format compact

disp(' ')
disp('=============================================================')
disp(' �� �O���t�̕ۑ� (1) ')
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
disp('+ fig �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> figure(2); savefig('graph')")
disp('+  >> % figure(2); savefig graph')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

figure(2); savefig('graph')
% figure(2); savefig graph
