% exercise_08_01_01.m
% ��� 8.1 (1)�F��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ�
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 8.1 (1) ')
disp('==================================================')

syms s
syms M c k positive

A = [ 0  1
      0 -c/M ]
B = [ 0
     1/M ]
C = [ 1  0 ]
D = 0

Ps = C*inv(s*eye(2) - A)*B + D