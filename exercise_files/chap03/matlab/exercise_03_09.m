% exercise_03_08.m
% 問題 3.9：RL 回路のパラメータ同定
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 3.9')
disp('==================================================')

syms s
syms R L positive
syms T K positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(L*s + R) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(L*s + R)

[Ns Ds] = numden(Ps);            % P(s) = N(s)/D(s)
alpha = fliplr(coeffs(Ds,s));    % D(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = Np(s)/Dp(s)（Dp(s) の定数項を 1 に）')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Nps = collect(Ns/alpha(2),s)     % Np(s)
Dps = collect(Ds/alpha(2),s)     % Dp(s)

a = fliplr(coeffs(Dps,s));       % Dp(s) の係数の抽出
b = fliplr(coeffs(Nps,s));       % Np(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = K/(1 + T*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve([a(1)-T b-K],[T K]); % 1 次遅れ要素の標準形のパラメータ

T = combine(sol.T)
K = combine(sol.K)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 図 3.2 から読み取った T, K の値')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T_val = 4e-3
K_val = 2e-2
 
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 同定された R, L の値')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol2 = solve([T-T_val K-K_val],[R L]);

R = sol2.R
L = sol2.L

disp(' ')
R = double(R)
L = double(L)




