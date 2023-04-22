% sample_impulse_step_multi1.m
% �����̃V�X�e���̃C���p���X�����ƒP�ʃX�e�b�v�����̕`��

close all
clear
format compact

sysP1 = tf([4 5],[1 2 5]);
sysP2 = tf([1],[1 1]);

figure(1); impulse(sysP1,sysP2)
figure(2); step(sysP1,sysP2)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')