% sample_ilaplace2.m
% �t���v���X�ϊ��F�� 3.7 (2)
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms s

fs = (s - 2)/(s^2 + 2*s + 5)
ft = ilaplace(fs)