% B2_02_exec.m
% 付録 B.2
% Simulink モデルの出力データの形式（構造体の回避）
% ：To Workspace（保存形式：配列）のデータにより描画

clc
clear
format compact

disp(' ')
disp('================================================')
disp(' ■ Simulink モデルの出力データの形式（構造体の回避） ')
disp(' 　：To Workspace（保存形式：配列）のデータにより描画 ')
disp('================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sim('sample2')")
disp("+  >> figure(1); plot(t,y,'LineWidth',2)")
disp('++++++++++++++++++++++++++++++++++++++++++++++++')

sim('sample2')

figure(1); plot(t,y,'LineWidth',2)