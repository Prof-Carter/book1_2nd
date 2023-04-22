% example_08_06_01.m
% �� 8.6�F�����ʂ���]����A�[���n�i�ɔz�u�@�ɂ��݌v�j
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 8.6 ')
disp('==================================================')

syms s
syms a0 a1 b0 real
syms k1 k2 real
syms p real
syms p1_star p2_star real

% -------------------------------------------
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]

K = [ k1   k2 ]

% -------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���ړI�ɋɔz�u ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp('--- ��(p) = |p*I - (A + B*K)| ---')
Delta1 = det(p*eye(2) - (A + B*K));
Delta1 = collect(Delta1,p)
gamma = coeffs(Delta1,p);   % �W���̒��o

disp(' ')
disp('--- ��(p) = (p - p1_star)*(p - p2_star) ---')
Delta2 = (p - p1_star)*(p - p2_star);
Delta2 = collect(Delta2,p)
delta = coeffs(Delta2,p);   % �W���̒��o

disp(' ')
disp('--- ��ԃt�B�[�h�o�b�N�Q�C�� K = [ k1  k2 ] ---')
[k1 k2] = solve(gamma-delta,{k1,k2})   % �W�����������Ȃ�悤�� K ������

% -------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �A�b�J�[�}���̋ɔz�u�A���S���Y�� ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

en = [ 0  1 ]
Vc = [ B  A*B ]

disp(' ')
disp('--- ��(p) = p^2 + delta1*p + delta0 ---')
delta0 = delta(1)
delta1 = delta(2)

disp(' ')
disp('--- ��ԃt�B�[�h�o�b�N�Q�C�� K ---')
disp('--- K - en*inv(Vc)*(A^2 + delta1*A + delta0*I) ---')
K = - en*inv(Vc)*(A^2 + delta1*A + delta0*eye(2));
k1 = K(1)
k2 = K(2)

