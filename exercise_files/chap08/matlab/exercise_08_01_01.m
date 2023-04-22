% exercise_08_01_01.m
% 問題 8.1 (1)：状態空間表現から伝達関数表現への変換
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 8.1 (1) ')
disp('==================================================')

syms s
syms M c k positive

A = [ 0  1
      0 -c/M ]
B = [ 0
     1/M ]
C = [ 1  0 ]
D = 0

Ps = C*inv(s*eye(2) - A)*B + D