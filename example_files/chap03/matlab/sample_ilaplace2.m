% sample_ilaplace2.m
% 逆ラプラス変換：例 3.7 (2)
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms s

fs = (s - 2)/(s^2 + 2*s + 5)
ft = ilaplace(fs)