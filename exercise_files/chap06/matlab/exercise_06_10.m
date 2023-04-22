% exercise_06_10.m
% ��� 6.10�F��� 6.4 (3) �̃i�C�L�X�g�O�Ղƃx�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.10 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

sysP = 1/(s + 1)^4

w = logspace(-3,3,10000);

%  ----- �i�C�L�X�g�O�Ղ̕`�� -----------------------------

figure(1)
nyquist(sysP,w)

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

figure(2)
nyquist(sysP,w,options)

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')



