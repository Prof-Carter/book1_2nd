% B2_01_exec1.m
% 付録 B.2
% Simulink モデルの実行 (1)
% ：To Workspace（保存形式：構造体）のデータにより描画

clc
clear
format compact

disp(' ')
disp('================================================')
disp(' ■ Simulink モデル sample.slx の実行 ')
disp(' 　：To Workspace（保存形式：構造体）のデータにより描画 ')
disp('================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> out = sim('sample');")
disp("+  >> figure(1); plot(out.t,out.y,'LineWidth',2)")
disp('++++++++++++++++++++++++++++++++++++++++++++++++')

out = sim('sample');

figure(1); plot(out.t,out.y,'LineWidth',2)
