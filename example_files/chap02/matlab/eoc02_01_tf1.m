% eoc02_01_tf1.m
% 関数 tf の使用例 1

clear
format compact

numP = [4 8];           % 伝達関数 P(s) の分子 N(s)
denP = [1 2 -15 0];     % 伝達関数 P(s) の分母 D(s)
sysP = tf(numP,denP)    % 伝達関数 P(s) = N(s)/D(s)
