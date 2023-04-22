% example_03_13.m
% 例 3.13：pi に複素数を含む場合の単位ステップ応答の計算 (1)
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.13 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s) = 10/(s^2 + 2s + 10)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 10/(s^2 + 2*s + 10)

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
ys = prod(factor(ys, 'FactorMode', 'full'))     % 複素数の形式も許可した因数分解

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s) を部分分数分解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 単位ステップ応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)
yt = simplify(yt,'Steps',100)   % 単純化ステップの数を増加

% ----- グラフの描画 ----------------------------------
figure(1)
fplot(yt,[0 5])
xlabel('t [s]')
ylabel('y(t)')
grid on

