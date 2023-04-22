% exercise_06_08_02.m
% 問題 6.8 (2)：RLC 回路の共振（共振を生じるときのピーク値）
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.8 (2)：共振を生じるときのピーク値')
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
disp(' L = 200 [mH], C = 10 [μF], R = 100 [Ω]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

L_val = 200e-3
C_val =  10e-6
R_val = 100

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 固有各周波数 wn')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wn = subs(wn,{L,C,R},{L_val,C_val,R_val});
wn = simplify(wn)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 減衰係数 ζ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

zeta = subs(zeta,{L,C,R},{L_val,C_val,R_val});
zeta = simplify(zeta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('  ピーク角周波数 wp = wn*(1 - 2*zeta^2)^(1/2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wp = wn*sqrt(1 - 2*zeta^2)
wp = double(wp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 共振ピーク Mp = 1/(2*zeta*(1 - zeta^2)^(1/2)) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Mp = 1/(2*zeta*sqrt(- zeta^2 + 1));
Mp = simplify(Mp)
Mp = double(Mp)



