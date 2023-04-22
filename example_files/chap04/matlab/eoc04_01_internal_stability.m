% eoc04_01_internal_stability.m
% 内部安定性（特性方程式の解）：例 4.3，4.4

clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.3 ')
disp('==================================================')
sysP = tf(1,[1 1])
sysC = tf([1 2],[1 0])
zero(1 + sysP*sysC)

disp(' ')
disp('==================================================')
disp(' 例 4.4 ')
disp('==================================================')
sysP = tf(1,[1 -1])
sysC = tf([1 -1],[1 1])
zero(1 + sysP*sysC)