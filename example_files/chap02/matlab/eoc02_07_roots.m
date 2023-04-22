% eoc02_07_roots.m
% 関数 pole, zero, zpkdata の使用例

clear
format compact

numP = [4 5];       % 伝達関数 P(s) = N(s)/D(s) の分子 N(s)
denP = [1 2 5];     % 伝達関数 P(s) = N(s)/D(s) の分母 D(s)

roots(denP)         % D(s) = 0 の解（伝達関数 P(s) の極）
roots(numP)         % N(s) = 0 の解（伝達関数 P(s) の零点）