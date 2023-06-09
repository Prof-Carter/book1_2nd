% example_04_08_02.m
% 例 4.8 (2)：ラウスの安定判別法（高次系）

clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 4.8 (2) ')
disp('==================================================')

s = tf('s');
Delta = s^4 + 4*s^3 + 11*s^2 + 14*s + 10

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ラウスの安定判別法')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

denP = tfdata(Delta,'v');

rhStabilityCriterion_jpn    % rhStabilityCriterion_jpn.m の実行

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 特性方程式 Δ(s) = 0 の解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

roots(denP)

