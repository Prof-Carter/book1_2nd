% exercise_08_01_02.m
% 問題 8.1 (2)：状態空間表現から伝達関数表現への変換
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 8.1 (2) ')
disp('==================================================')

syms s
syms R L C positive

A  = [   0     1
     -1/(L*C) -R/L ]
B  = [   0
        1/L ]
Cm = [  1/C    0 ]
D  = 0

Ps = Cm*inv(s*eye(2) - A)*B + D