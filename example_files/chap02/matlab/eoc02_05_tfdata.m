% eoc02_05_tfdata.m
% �֐� tfdata �̎g�p��

clear
format compact

sysP = tf([4 8],[1 2 -15 0])    % �`�B�֐� P(s) ���֐� tf �ɂ���`
[numP,denP] = tfdata(sysP,'v')  % �֐� tfdata �ɂ��`�B�֐� P(s) = N(s)/D(s) �̕��q N(s)�C���� D(s) �𒊏o
