% sample_impulse_step3.m
% �C���p���X�����ƒP�ʃX�e�b�v�����̕`��

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
figure(1); impulse(sysP,t)
figure(2); step(sysP,t)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')