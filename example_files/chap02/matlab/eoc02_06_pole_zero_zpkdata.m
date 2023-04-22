% eoc02_06_pole_zero_zpkdata.m
% 関数 pole, zero, zpkdata の使用例

clear
format compact

sysP = tf([4 8],[1 2 -15 0])    % 伝達関数 P(s) を関数 tf により定義
pole(sysP)                      % 伝達関数 P(s) の極
zero(sysP)                      % 伝達関数 P(s) の零点
[z p K] = zpkdata(sysP,'v')     % 伝達関数 P(s) の零点，極，ゲイン
