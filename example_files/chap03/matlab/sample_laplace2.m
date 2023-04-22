% sample_laplace2.m
% ラプラス変換：例 3.6 (2)
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms t real

ft = exp(-t)*(cos(2*t) - (3/2)*sin(2*t))
fs = laplace(ft)
fs = prod(factor(fs))