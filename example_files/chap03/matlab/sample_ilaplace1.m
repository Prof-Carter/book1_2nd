% sample_ilaplace1.m
% 逆ラプラス変換：例 3.7 (1)
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms s

% fs = 1/s - 3/(s + 2) + 2/(s + 3)
fs = 6/(s*(s + 2)*(s + 3))
ft = ilaplace(fs)