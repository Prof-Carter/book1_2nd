% example_08_06_01.m
% 例 8.6：鉛直面を回転するアーム系（極配置法による設計）
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.6 ')
disp('==================================================')

syms s
syms a0 a1 b0 real
syms k1 k2 real
syms p real
syms p1_star p2_star real

% -------------------------------------------
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]

K = [ k1   k2 ]

% -------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 直接的に極配置 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('--- Δ(p) = |p*I - (A + B*K)| ---')
Delta1 = det(p*eye(2) - (A + B*K));
Delta1 = collect(Delta1,p)
gamma = coeffs(Delta1,p);   % 係数の抽出

disp(' ')
disp('--- Δ(p) = (p - p1_star)*(p - p2_star) ---')
Delta2 = (p - p1_star)*(p - p2_star);
Delta2 = collect(Delta2,p)
delta = coeffs(Delta2,p);   % 係数の抽出

disp(' ')
disp('--- 状態フィードバックゲイン K = [ k1  k2 ] ---')
[k1 k2] = solve(gamma-delta,{k1,k2})   % 係数が等しくなるように K を決定

% -------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' アッカーマンの極配置アルゴリズム ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

en = [ 0  1 ]
Vc = [ B  A*B ]

disp(' ')
disp('--- Δ(p) = p^2 + delta1*p + delta0 ---')
delta0 = delta(1)
delta1 = delta(2)

disp(' ')
disp('--- 状態フィードバックゲイン K ---')
disp('--- K - en*inv(Vc)*(A^2 + delta1*A + delta0*I) ---')
K = - en*inv(Vc)*(A^2 + delta1*A + delta0*eye(2));
k1 = K(1)
k2 = K(2)

