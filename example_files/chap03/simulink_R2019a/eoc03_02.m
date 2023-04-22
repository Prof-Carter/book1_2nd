% eoc03_01.m
% Simulink モデルを利用した単位ステップ応答の描画：例 3.13
% （Simulink ブロック To File のデータを利用）

close all
clear
format compact

sim('sim_step')

load('datafile')
figure(1); plot(output.Time,output.Data)
xlabel('t [s]'); ylabel('y(t)')

