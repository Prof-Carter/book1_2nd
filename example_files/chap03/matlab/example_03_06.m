% example_03_06.m
% �� 3.6�F���v���X�ϊ��\�̗��p
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms t real

disp(' ')
disp('==================================================')
disp(' �� 3.6 (1) ')
disp('==================================================')

ft = 1 - 3*exp(-2*t) + 2*exp(-3*t)
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp('==================================================')
disp(' �� 3.6 (2) ')
disp('==================================================')

ft = exp(-t)*(cos(2*t) - (3/2)*sin(2*t))
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp('==================================================')
disp(' �� 3.6 (3) ')
disp('==================================================')

ft = 2*t - 1 + exp(-2*t)
fs = laplace(ft)
fs = prod(factor(fs))

