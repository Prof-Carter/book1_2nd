% sample_laplace1.m
% ���v���X�ϊ��F�� 3.6 (1)
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms t real

ft = 1 - 3*exp(-2*t) + 2*exp(-3*t)
fs = laplace(ft)
fs = prod(factor(fs))