% exercise_03_06.m
% ��� 3.6�F����ȃV�X�e���̒P�ʃX�e�b�v�����̒��l
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms s
syms t real

disp(' ')
disp('==================================================')
disp(' ��� 3.6 (1) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = (s + 1)/(s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++')

Ps = (s + 1)/(s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' u(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++')

ut = sym(1)         % �������͈ȉ��̂悤�ɋL�q
us = laplace(ut)    % us = 1/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s) �𕔕���������')
disp('++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)   % �ȗ����Ă��ǂ�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' �P�ʃX�e�b�v���� y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(t) �̋Ɍ��l')
disp('++++++++++++++++++++++++++++++++++++++++++')

yinf = limit(yt,t,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' �ŏI�l�̒藝 yinf = P(0)')
disp('++++++++++++++++++++++++++++++++++++++++++')

yinf = subs(Ps,s,0)


disp(' ')
disp('==================================================')
disp(' ��� 3.6 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 2/(s + 1)^10')
disp('++++++++++++++++++++++++++++++++++++++++++')

Ps = 2/(s + 1)^10

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' u(t) = 1')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++')

ut = sym(1)         % �������͈ȉ��̂悤�ɋL�q
us = laplace(ut)    % us = 1/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s) �𕔕���������')
disp('++++++++++++++++++++++++++++++++++++++++++')

ys = partfrac(ys)   % �ȗ����Ă��ǂ�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' �P�ʃX�e�b�v���� y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' y(t) �̋Ɍ��l')
disp('++++++++++++++++++++++++++++++++++++++++++')

yinf = limit(yt,t,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++')
disp(' �ŏI�l�̒藝 yinf = P(0)')
disp('++++++++++++++++++++++++++++++++++++++++++')

yinf = subs(Ps,s,0)