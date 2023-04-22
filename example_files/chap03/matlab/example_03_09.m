% example_03_09.m
% 例 3.9：単位ステップ応答の計算
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.9 ')
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
disp('+ u(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = sym(1)         % もしくは以下のように記述
us = laplace(ut)    % us = 1/s

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
disp('+ 単位ステップ応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% ----- グラフの描画 ----------------------------------
figure(1)
fplot(yt,[0 5])
xlabel('t [s]');
ylabel('y(t)')

