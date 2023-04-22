% exercise_06_04_02.m
% ��� 6.4 (2)�F�x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.4 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = exp(-L*s)/(T*s + 1)')
disp(' �@�@�@�@    L = 1, T = 0.2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

L = 1
T = 0.2

sysP = exp(-L*s)/(T*s + 1)

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

w = logspace(-2,2,10000);

figure(1)
nyquist(sysP,w,options)

