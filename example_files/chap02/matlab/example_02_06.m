% example_02_06.m
% 例 2.6
% 1 次遅れ要素の標準形：RL 回路の伝達関数
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 2.6 ')
disp('==================================================')

clear
format compact

syms s
syms R L positive

disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(Ls + R) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(L*s + R)

[Ns Ds] = numden(Ps);            % P(s) = N(s)/D(s)
alpha = fliplr(coeffs(Ds,s));    % D(s) の係数の抽出

disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = Np(s)/Dp(s)（Dp(s) の定数項を 1 に）')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Nps = collect(Ns/alpha(2),s)     % Np(s)
Dps = collect(Ds/alpha(2),s)     % Dp(s)

a = fliplr(coeffs(Dps,s));       % Dp(s) の係数の抽出
b = fliplr(coeffs(Nps,s));       % Np(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = K/(1 + Ts)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms T K positive

sol = solve([a(1)-T b-K],[T K]); % 1 次遅れ要素の標準形のパラメータ

disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 時定数：T')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T = combine(sol.T)               % combine により同じ代数的構造の項を結合

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ゲイン：K')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

K = combine(sol.K)               % combine により同じ代数的構造の項を結合

