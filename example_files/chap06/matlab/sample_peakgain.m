% sample_peakgain.m
% ���U�s�[�N�C�s�[�N�p���g��

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

[Mp wp] = getPeakGain(sysP,1e-5)
