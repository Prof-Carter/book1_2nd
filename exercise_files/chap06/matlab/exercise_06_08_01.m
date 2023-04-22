% exercise_06_08_01.m
% 問題 6.8 (1)：RLC 回路の共振（共振を生じない条件）
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.8 (1)：共振を生じない条件')
disp('==================================================')

syms s
syms R L C positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(L*C*s^2 + R*C*s + 1)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(L*C*s^2 + R*C*s + 1)

[Ns Ds] = numden(Ps);            % P(s) = N(s)/D(s)
alpha = fliplr(coeffs(Ds,s));    % D(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = Np(s)/Dp(s)（Dp(s) の s^2 の係数を 1 に）')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Nps = collect(Ns/alpha(1),s)     % Np(s)
Dps = collect(Ds/alpha(1),s)     % Dp(s)

a = fliplr(coeffs(Dps,s));       % Dp(s) の係数の抽出
b = fliplr(coeffs(Nps,s));       % Np(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('P(s) = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 固有角周波数：wn')
disp(' 減衰係数：ζ')
disp(' ゲイン：K')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms wn zeta K positive

sol = solve([a(2)-2*zeta*wn ...
             a(3)-wn^2 ...
             b-K*wn^2],[wn zeta K]);    % 2 次遅れ要素の標準形のパラメータ

wn   = combine(sol.wn)      % combine により同じ代数的構造の項を結合
zeta = combine(sol.zeta)    % combine により同じ代数的構造の項を結合
K    = combine(sol.K)       % combine により同じ代数的構造の項を結合

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 共振を生じない R の条件')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(zeta >= 1/sqrt(2),R,'ReturnConditions',true);    % ζ >= 1/sqrt(2) を R について解く
condition = subs(sol.conditions,R);
condition = combine(condition)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L = 200 [mH], C = 10 [μF] としたときの')
disp(' 共振を生じない R の条件')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

subs(condition,{L,C},{200e-3,10e-6})





