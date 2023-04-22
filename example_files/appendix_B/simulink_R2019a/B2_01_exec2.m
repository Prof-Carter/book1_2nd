% B2_01_exec2.m
% 付録 B.2
% Simulink モデルの実行 (2)
% ：To File により mat ファイルに格納された時系列のデータにより描画

clc
clear
format compact

disp(' ')
disp('============================================================')
disp(' ■ Simulink モデル sample.slx の実行 ')
disp(' 　：To File のデータにより描画 ')
disp('============================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> out = sim('sample');")
disp("+  >> load('datafile')")
disp("+  >> output")
disp("+  >> figure(1); plot(output.Time,output.Data,'LineWidth',2)")
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

out = sim('sample');

load('datafile')
output

figure(1); plot(output.Time,output.Data,'LineWidth',2)
