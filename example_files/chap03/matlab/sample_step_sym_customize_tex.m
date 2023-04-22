% sample_step_sym_customize_tex.m
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

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
fplot(yt,[0 5],'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)
grid on

set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.2:1.2)