% sample_step_sym.m
% 単位ステップ応答の計算と描画：例 3.13
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

syms t real         % 時間変数 t の定義
syms s              % ラプラス演算子の定義

ut = sym(1)         % u(t) = 1 の定義
us = laplace(ut)    % u(t) = 1 のラプラス変換

Ps = 10/(s^2 + 2*s + 10)    % 伝達関数 P(s) の定義
ys = Ps*us                  % y(s)
ys = partfrac(ys)           % y(s) を部分分数分解

yt = ilaplace(ys)           % y(s) の逆ラプラス変換：単位ステップ応答

dyt = diff(yt,t);           % dy(t)/dt
dyt = simplify(dyt)         % dy(t)/dt の単純化

figure(1)           % Figure 1 を指定
fplot(yt,[0 5])     % 単位ステップ応答 y(t) を 0～5 秒の間で描画
xlabel('t [s]')     % 横軸のラベル
ylabel('y(t)')      % 縦軸のラベル
grid on             % 補助線の表示
