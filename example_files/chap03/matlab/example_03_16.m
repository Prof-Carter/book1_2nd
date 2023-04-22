% example_03_16.m
% 例 3.16：代表極
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.16 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t tau real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = sym(1)         % もしくは以下のように記述
us = laplace(ut)    % us = 1/s

disp(' ')
disp('==================================================')
disp('+ P1(s) = 10/((tau s + 1)(s + 1))')
disp('==================================================')

P1s = 1/((tau*s + 1)*(s + 1))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y1(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y1s = P1s*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y1(s) を部分分数分解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y1s = partfrac(y1s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 単位ステップ応答 y1(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y1t = ilaplace(y1s)


disp(' ')
disp('==================================================')
disp('+ P2(s) = 1/(s + 1)')
disp('==================================================')

P2s = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y2(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y2s = P2s*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y2(s) を部分分数分解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y2s = partfrac(y2s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 単位ステップ応答 y2(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y2t = ilaplace(y2s)

% ----- グラフの描画 ----------------------------------
figure(1)
fplot(subs(y1t,tau,0.1),[0 5])
hold on
fplot(y2t,[0 5])
hold off
xlabel('t [s]')
ylabel('y(t)')
grid on

legend({'P1(s)','P2(s)'},'Location','southeast')
