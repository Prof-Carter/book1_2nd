% example_03_01.m
% 例 3.1：単位ステップ関数 f(t) = 1 のラプラス変換
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 3.1：単位ステップ関数 f(t) = 1 のラプラス変換')
disp('==================================================')

syms s
syms t real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ f(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

f(t) = sym(1)   % シンボリック変数として 1 を定義

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 不定積分 F_indef(s) = ∫ f(t)*exp(-s*t) dt')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_indef(s) = int(f(t)*exp(-s*t),t)

assume(real(s) > 0)
assumptions(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ F_inf(s) = lim F_indef(s)')
disp('+           t->inf')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_inf(s) = limit(F_indef(s),t,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ F_0(s) = lim F_indef(s)')
disp('+          t->0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_0(s) = limit(F_indef(s),t,0)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 定義式に基づくラブラス変換 F(s) = F_inf(s) - F_0(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F(s) = F_inf(s) - F_0(s)
