% A3_02_plot.m
% 付録 A.3

clc
close all
clear
format compact

disp(' ')
disp('=========================================')
disp(' ■ グラフの描画 ')
disp('=========================================')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> x = -5:0.1:5;')
disp('+  >> y = x.^2 - 2*x - 5;')
disp('+  >> figure(1)')
disp('+  >> plot(x,y)')
disp("+  >> xlabel('x')")
disp("+  >> ylabel('y')")
disp('+  >> grid on')
disp("+  >> movegui('northwest') % 左上に配置")
disp('++++++++++++++++++++++++++++++')

x = -5:0.1:5;
y = x.^2 - 2*x - 5;
figure(1)
plot(x,y)
xlabel('x')
ylabel('y')
grid on

movegui('northwest')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> figure(2)')
disp("+  >> plot(x,y,'r--','LineWidth',2)")
disp("+  >> set(gca,'FontSize',16,'FontName','Arial')")
disp("+  >> xlim([-4 4]); set(gca,'XTick',-4:1:4)")
disp("+  >> ylim([-10 20]); set(gca,'YTick',-10:5:20)")
disp("+  >> xlabel('x','FontSize',18,'FontName','Arial')")
disp("+  >> ylabel('y','FontSize',18,'FontName','Arial')")
disp('+  >> grid on')
disp("+  >> movegui('north') % 中央上に配置")
disp('++++++++++++++++++++++++++++++')

figure(2)
plot(x,y,'r--','LineWidth',2)
set(gca,'FontSize',16,'FontName','Arial')
xlim([-4 4]); set(gca,'XTick',-4:1:4)
ylim([-10 20]); set(gca,'YTick',-10:5:20)
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
grid on

movegui('north')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> figure(3)')
disp("+  >> plot(x,y,'Color',[192 80 77]/255,'LineWidth',2)")
disp("+  >> movegui('northeast') % 右上に配置")
disp('++++++++++++++++++++++++++++++')

figure(3)
plot(x,y,'Color',[192 80 77]/255,'LineWidth',2)

movegui('northeast')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> y1 = x.^2 - 2*x - 5;')
disp('+  >> y2 = 2*x.^2 + 1;')
disp('+  >> figure(4); plot(x,y1,x,y2)')
disp("+  >> movegui('southwest') % 左下に配置")
disp('++++++++++++++++++++++++++++++')

y1 = x.^2 - 2*x - 5;
y2 = 2*x.^2 + 1;
figure(4); plot(x,y1,x,y2)

movegui('southwest')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> y1 = x.^2 - 2*x - 5;')
disp('+  >> y2 = 2*x.^2 + 1;')
disp('+  >> figure(5); plot(x,y1); hold on')
disp('+  >> figure(5); plot(x,y2); hold off')
disp("+  >> movegui('south') % 中央下に配置")
disp('++++++++++++++++++++++++++++++')

y1 = x.^2 - 2*x - 5;
y2 = 2*x.^2 + 1;
figure(5); plot(x,y1); hold on
figure(5); plot(x,y2); hold off

movegui('south')

