% B2_01_exec2.m
% �t�^ B.2
% Simulink ���f���̎��s (2)
% �FTo File �ɂ�� mat �t�@�C���Ɋi�[���ꂽ���n��̃f�[�^�ɂ��`��

clc
clear
format compact

disp(' ')
disp('============================================================')
disp(' �� Simulink ���f�� sample.slx �̎��s ')
disp(' �@�FTo File �̃f�[�^�ɂ��`�� ')
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
