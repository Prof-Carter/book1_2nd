% eoc03_01.m
% Simulink ���f���𗘗p�����P�ʃX�e�b�v�����̕`��F�� 3.13
% �iSimulink �u���b�N To Workspace �̃f�[�^�𗘗p�j

close all
clear
format compact

sim('sim_step')

figure(1); plot(t,y)
xlabel('t [s]'); ylabel('y(t)')
