% eoc02_05_tfdata.m
% 関数 tfdata の使用例

clear
format compact

sysP = tf([4 8],[1 2 -15 0])    % 伝達関数 P(s) を関数 tf により定義
[numP,denP] = tfdata(sysP,'v')  % 関数 tfdata により伝達関数 P(s) = N(s)/D(s) の分子 N(s)，分母 D(s) を抽出
