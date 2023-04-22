% exercise_03_04a_customize.m
% 問題 3.4：単位ステップ応答の描画

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (1) ')
disp('==================================================')

sysP = 3/(s + 2)
y = step(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 8])
ylim([0 2])
set(gca,'XTick',0:1:8)
set(gca,'YTick',0:0.5:2)

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (2) ')
disp('==================================================')

sysP = (s + 4)/((s + 1)*(s + 2))
y = step(sysP,t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 8])
ylim([0 2.5])
set(gca,'XTick',0:1:8)
set(gca,'YTick',0:0.5:2.5)

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (3) ')
disp('==================================================')

sysP = 2/(s + 1)^2
y = step(sysP,t);

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 8])
ylim([0 2.5])
set(gca,'XTick',0:1:8)
set(gca,'YTick',0:0.5:2.5)

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (4) ')
disp('==================================================')

sysP = 5/(s^2 + 2*s + 5)
y = step(sysP,t);

figure(4)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)
grid on

xlim([0 8])
ylim([0 1.5])
set(gca,'XTick',0:1:8)
set(gca,'YTick',0:0.5:1.5)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


