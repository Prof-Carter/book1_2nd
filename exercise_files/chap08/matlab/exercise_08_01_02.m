% exercise_08_01_02.m
% ��� 8.1 (2)�F��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ�
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 8.1 (2) ')
disp('==================================================')

syms s
syms R L C positive

A  = [   0     1
     -1/(L*C) -R/L ]
B  = [   0
        1/L ]
Cm = [  1/C    0 ]
D  = 0

Ps = Cm*inv(s*eye(2) - A)*B + D