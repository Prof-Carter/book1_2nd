% exercise_03_07b_customize.m
% 問題 3.7：1 次遅れ系のインパルス応答
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 3.7 ')
disp('==================================================')

syms s
syms t real
syms T K positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = K/(1 + T*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = K/(1 + T*s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(t) = δ(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = dirac(t)       % もしくは以下のように記述
us = laplace(ut)    % us = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' インパルス応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% -------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

for T_val = [0.5 1 2]
    figure(1)
    fplot(subs(yt,{T,K},{T_val,1}),[0 5],'LineWidth',1.5)
    hold on
end

figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)

grid on

xlim([0 5])
ylim([0 2])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:2)

legend({'T = 0.5, K = 1', 'T = 1, K = 1', 'T = 2, K = 1'}, ...
       'FontName','Arial','FontSize',16)

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

for K_val = [0.5 1 2]
    figure(2)
    fplot(subs(yt,{T,K},{1,K_val}),[0 5],'LineWidth',1.5)
    hold on
end

figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)

grid on

xlim([0 5])
ylim([0 2])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:2)

legend({'T = 1, K = 0.5', 'T = 1, K = 1', 'T = 1, K = 2'}, ...
       'FontName','Arial','FontSize',16)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
