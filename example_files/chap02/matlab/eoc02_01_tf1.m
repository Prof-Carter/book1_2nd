% eoc02_01_tf1.m
% �֐� tf �̎g�p�� 1

clear
format compact

numP = [4 8];           % �`�B�֐� P(s) �̕��q N(s)
denP = [1 2 -15 0];     % �`�B�֐� P(s) �̕��� D(s)
sysP = tf(numP,denP)    % �`�B�֐� P(s) = N(s)/D(s)
