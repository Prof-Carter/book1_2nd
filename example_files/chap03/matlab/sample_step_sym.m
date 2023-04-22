% sample_step_sym.m
% �P�ʃX�e�b�v�����̌v�Z�ƕ`��F�� 3.13
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

syms t real         % ���ԕϐ� t �̒�`
syms s              % ���v���X���Z�q�̒�`

ut = sym(1)         % u(t) = 1 �̒�`
us = laplace(ut)    % u(t) = 1 �̃��v���X�ϊ�

Ps = 10/(s^2 + 2*s + 10)    % �`�B�֐� P(s) �̒�`
ys = Ps*us                  % y(s)
ys = partfrac(ys)           % y(s) �𕔕���������

yt = ilaplace(ys)           % y(s) �̋t���v���X�ϊ��F�P�ʃX�e�b�v����

dyt = diff(yt,t);           % dy(t)/dt
dyt = simplify(dyt)         % dy(t)/dt �̒P����

figure(1)           % Figure 1 ���w��
fplot(yt,[0 5])     % �P�ʃX�e�b�v���� y(t) �� 0�`5 �b�̊Ԃŕ`��
xlabel('t [s]')     % �����̃��x��
ylabel('y(t)')      % �c���̃��x��
grid on             % �⏕���̕\��
