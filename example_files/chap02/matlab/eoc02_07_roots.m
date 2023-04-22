% eoc02_07_roots.m
% �֐� pole, zero, zpkdata �̎g�p��

clear
format compact

numP = [4 5];       % �`�B�֐� P(s) = N(s)/D(s) �̕��q N(s)
denP = [1 2 5];     % �`�B�֐� P(s) = N(s)/D(s) �̕��� D(s)

roots(denP)         % D(s) = 0 �̉��i�`�B�֐� P(s) �̋Ɂj
roots(numP)         % N(s) = 0 �̉��i�`�B�֐� P(s) �̗�_�j