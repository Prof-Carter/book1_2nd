% sample_laplace2.m
% ���v���X�ϊ��F�� 3.6 (2)
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms t real

ft = exp(-t)*(cos(2*t) - (3/2)*sin(2*t))
fs = laplace(ft)
fs = prod(factor(fs))