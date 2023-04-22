% exercise_04_07_02b.m
% 問題 4.7 (2)：定常位置偏差
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 4.7 (2) ')
disp('==================================================')

syms s
syms kP kI real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ コントローラ C(s) = (kP*s + kI)/s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = (kP*s + kI)/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Ger(s) = 1/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gers = 1/(1 + Ps*Cs);
Gers = collect(Gers,s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ フルビッツの安定判別法')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[N D] = numden(Gers);
Delta = D;
Delta = collect(Delta,s)

hurwitz_sym     % hurwitz_sym.m の実行

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 定常位置偏差 e_inf = Ger(0)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

e_inf = subs(Gers,s,0)


