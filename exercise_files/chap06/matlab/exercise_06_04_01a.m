% exercise_06_04_01a.m
% ��� 6.4 (1)�F�x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.4 (1) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = exp(-L*s), L = 1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

L = 1

sysP = exp(-L*s)

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

w = logspace(-2,2,10000);

figure(1)
nyquist(sysP,w,options)




