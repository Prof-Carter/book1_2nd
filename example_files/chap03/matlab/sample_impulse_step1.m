% sample_impulse_step1.m
% �C���p���X�����ƒP�ʃX�e�b�v�����̕`��

close all
clear
format compact

sysP = tf([10],[1 2 10]);

figure(1); impulse(sysP)
figure(2); step(sysP)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')