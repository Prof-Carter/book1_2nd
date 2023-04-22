% exercise_04_03_01.m
% 問題 4.3 (1)：フルビッツの安定判別法（高次系）

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 4.3 (1) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性多項式 Δ(s) = s^3 + 4*s^2 + 14*s + 20')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
Delta = s^3 + 4*s^2 + 14*s + 20

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' フルビッツの安定判別法')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

denP = tfdata(Delta,'v');

hurwitz    % hurwitz.m の実行

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性方程式 Δ(s) = 0 の解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

roots(denP)