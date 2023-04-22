% example_03_08.m
% 例 3.8：インパルス応答の計算
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.8 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s) = 1/(s + 1)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(t) = δ(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = dirac(t)       % もしくは以下のように記述
us = laplace(ut)    % us = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s) を部分分数分解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)   % 省略しても良い

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ インパルス応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% ----- グラフの描画 ----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(yt,[0 5],'LineWidth',1.5);

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)

grid on

xlim([0 5])
ylim([0 1.5])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:1.5)
