% example_03_08.m
% �� 3.8�F�C���p���X�����̌v�Z
% �ySymbolic Math Toolbox ���K�v�z

disp(' ')
disp('==================================================')
disp(' �� 3.8 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s) = 1/(s + 1)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(t) = ��(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = dirac(t)       % �������͈ȉ��̂悤�ɋL�q
us = laplace(ut)    % us = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s) �𕔕���������')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)   % �ȗ����Ă��ǂ�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �C���p���X���� y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% ----- �O���t�̕`�� ---------------------------------
figure(1)
fplot(yt,[0 5])
xlabel('t [s]');
ylabel('y(t)')