% exercise_03_04b_customize.m
% 問題 3.4：単位ステップ応答の計算と描画
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

syms s
syms t real

ut = sym(1)         % もしくは以下のように記述
us = laplace(ut)    % us = 1/s

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (1) ')
disp('==================================================')

Ps = 3/(s + 2)

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(yt,[0 8],'LineWidth',1.5)

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

Ps = (s + 4)/((s + 1)*(s + 2))

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(yt,[0 8],'LineWidth',1.5)

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

Ps = 2/(s + 1)^2

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(yt,[0 8],'LineWidth',1.5)

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

Ps = 5/(s^2 + 2*s + 5)

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(4)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(yt,[0 8],'LineWidth',1.5)

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


