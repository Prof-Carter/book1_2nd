% B2_01_exec1.m
% �t�^ B.2
% Simulink ���f���̎��s (1)
% �FTo Workspace�i�ۑ��`���F�\���́j�̃f�[�^�ɂ��`��

clc
clear
format compact

disp(' ')
disp('================================================')
disp(' �� Simulink ���f�� sample.slx �̎��s ')
disp(' �@�FTo Workspace�i�ۑ��`���F�\���́j�̃f�[�^�ɂ��`�� ')
disp('================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> out = sim('sample');")
disp("+  >> figure(1); plot(out.t,out.y,'LineWidth',2)")
disp('++++++++++++++++++++++++++++++++++++++++++++++++')

out = sim('sample');

figure(1); plot(out.t,out.y,'LineWidth',2)
