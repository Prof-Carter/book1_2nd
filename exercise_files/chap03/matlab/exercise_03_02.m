% exercise_03_02.m
% ��� 3.2�F���v���X�ϊ�
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms t real

disp(' ')
disp('==================================================')
disp(' ��� 3.2 (1) ')
disp('==================================================')

ft = 1 - exp(-5*t)
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp('==================================================')
disp(' ��� 3.2 (2) ')
disp('==================================================')

ft = exp(-2*t) + 2*exp(t) - 3
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp('==================================================')
disp(' ��� 3.2 (3) ')
disp('==================================================')

ft = 2*exp(-t) - 2*cos(2*t) + sin(2*t)
fs = laplace(ft)
fs = prod(factor(fs))

disp(' ')
disp('==================================================')
disp(' ��� 3.2 (4) ')
disp('==================================================')

ft = 3 + 2*t + 2*t^2 - 3*exp(-2*t)
fs = laplace(ft)
fs = prod(factor(fs))