% sample_partfrac2.m
% 部分分数分解：(3.109) 式
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

syms s

ys = 2/(s^3 + 4*s^2 + 4*s)      % 単位ステップ応答のラプラス変換 y(s)
ys = partfrac(ys)               % 部分分数分解

% 以下，追加
yt = ilaplace(ys)               % 逆ラプラス変換 y(t)

figure(1); fplot(yt,[0 10]);    % y(t) の描画
xlabel('time [s]'); ylabel('y(t)'); grid
