% arm_ss.m
% ��ԋ�ԕ\���̒�`�i�����ʂ���]����A�[���n�j

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