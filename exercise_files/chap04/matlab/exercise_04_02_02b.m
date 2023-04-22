% exercise_04_02_02b.m
% 問題 4.2 (2)：内部安定性
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 4.2 (2) ')
disp('==================================================')

syms s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 P(s) = Np(s)/Dp(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/((s - 1)*(s + 2))
[Np Dp] = numden(Ps)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ C(s) = Nc(s)/Dc(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = sym(1)
[Nc Dc] = numden(Cs)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性多項式 Δ(s) = Dp(s)*Dc(s) + Np(s)*Nc(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Delta = Dp*Dc + Np*Nc
Delta = collect(Delta,s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 4 つの伝達関数：Gyr(s), Gyd(s), Gur(s), Gud(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = Ps*Cs/(1 + Ps*Cs);
Gyr = prod(factor(Gyr))

Gyd = Ps/(1 + Ps*Cs);
Gyd = prod(factor(Gyd))

Gur = Cs/(1 + Ps*Cs);
Gur = prod(factor(Gur))

Gud = -Ps*Cs/(1 + Ps*Cs);
Gud = prod(factor(Gud))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性方程式 Δ(s) = 0 の解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = solve(Delta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 内部安定性の判別')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
if real(s) < 0
    disp('内部安定である')
else
    disp('内部安定ではない')    
end
