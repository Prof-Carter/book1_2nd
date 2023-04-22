% eoc02_03_zpk.m
% 関数 zpk の使用例

clear
format compact

z = [-2]; p = [-5 0 3];     % 零点，極の定義  
K = 4;                      % ゲインの定義
sysP = zpk(z,p,K)           % 零点・極・ゲイン形式の伝達関数 P(s)
