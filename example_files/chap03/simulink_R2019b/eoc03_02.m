% eoc03_01.m
% Simulink ���f���𗘗p�����P�ʃX�e�b�v�����̕`��F�� 3.13
% �iSimulink �u���b�N To File �̃f�[�^�𗘗p�j

close all
clear
format compact

sim('sim_step')

load('datafile')
figure(1); plot(output.Time,output.Data)
xlabel('t [s]'); ylabel('y(t)')

