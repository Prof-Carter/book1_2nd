% exercise_04_05_02.m
% 問題 4.5〔問題 4.3 (2)〕：ラウスの安定判別法（高次系）

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 4.5 <----- 問題 4.3 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性多項式 Δ(s) = s^3 + 4*s^2 + 14*s + 20')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
Delta = s^4 + 2*s^3 + 5*s^2 + 34*s + 30

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ラウスの安定判別法')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

denP = tfdata(Delta,'v');

rhStabilityCriterion_jpn    % rhStabilityCriterion_jpn.m の実行

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 特性方程式 Δ(s) = 0 の解')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

roots(denP)
