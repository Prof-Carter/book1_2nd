% sample_ilaplace1.m
% �t���v���X�ϊ��F�� 3.7 (1)
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms s

% fs = 1/s - 3/(s + 2) + 2/(s + 3)
fs = 6/(s*(s + 2)*(s + 3))
ft = ilaplace(fs)