% sample_laplace1.m
% ラプラス変換：例 3.6 (1)
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms t real

ft = 1 - 3*exp(-2*t) + 2*exp(-3*t)
fs = laplace(ft)
fs = prod(factor(fs))