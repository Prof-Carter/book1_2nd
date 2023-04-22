% sample_partfrac2.m
% �������������F(3.109) ��
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

syms s

ys = 2/(s^3 + 4*s^2 + 4*s)      % �P�ʃX�e�b�v�����̃��v���X�ϊ� y(s)
ys = partfrac(ys)               % ������������

% �ȉ��C�ǉ�
yt = ilaplace(ys)               % �t���v���X�ϊ� y(t)

figure(1); fplot(yt,[0 10]);    % y(t) �̕`��
xlabel('time [s]'); ylabel('y(t)'); grid
