% B2_02_exec.m
% �t�^ B.2
% Simulink ���f���̏o�̓f�[�^�̌`���i�\���̂̉���j
% �FTo Workspace�i�ۑ��`���F�z��j�̃f�[�^�ɂ��`��

clc
clear
format compact

disp(' ')
disp('================================================')
disp(' �� Simulink ���f���̏o�̓f�[�^�̌`���i�\���̂̉���j ')
disp(' �@�FTo Workspace�i�ۑ��`���F�z��j�̃f�[�^�ɂ��`�� ')
disp('================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sim('sample2')")
disp("+  >> figure(1); plot(t,y,'LineWidth',2)")
disp('++++++++++++++++++++++++++++++++++++++++++++++++')

sim('sample2')

figure(1); plot(t,y,'LineWidth',2)