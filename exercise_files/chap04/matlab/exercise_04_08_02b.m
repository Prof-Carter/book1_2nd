% exercise_04_08_02b.m
% 問題 4.8 (2)：単位ステップ外乱に対する定常値
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 4.8 (2) ')
disp('==================================================')

syms s
syms kP kI real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ C(s) = (kP*s + kI)/s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = (kP*s + kI)/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyds = Ps/(1 + Ps*Cs);
Gyds = collect(Gyds,s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' フルビッツの安定判別法')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[N D] = numden(Gyds);
Delta = D;
Delta = collect(Delta,s)

hurwitz_sym     % hurwitz_sym.m の実行

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 単位ステップ外乱に対する定常値 y_inf = Gyd(0)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y_inf = subs(Gyds,s,0)


