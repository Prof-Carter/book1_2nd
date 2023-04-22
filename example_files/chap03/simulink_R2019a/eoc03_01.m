% eoc03_01.m
% Simulink モデルを利用した単位ステップ応答の描画：例 3.13
% （Simulink ブロック To Workspace のデータを利用）

close all
clear
format compact

sim('sim_step')

figure(1); plot(t,y)
xlabel('t [s]'); ylabel('y(t)')
