% arm_ss.m
% 状態空間表現の定義（鉛直面を回転するアーム系）

close all
clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
B = [ 0
     1/J ];
C = [ 1  0 ];
D = 0;

sys = ss(A,B,C,D)