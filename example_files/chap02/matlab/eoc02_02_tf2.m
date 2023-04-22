% eoc02_02_tf2.m
% 関数 tf の使用例 2

clear
format compact

s = tf('s');                            % ラプラス演算子 s の定義
sysP = (4*s + 8)/(s^3 + 2*s^2 - 15*s)   % 伝達関数 P(s) の定義
