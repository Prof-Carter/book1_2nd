% eoc02_06_pole_zero_zpkdata.m
% �֐� pole, zero, zpkdata �̎g�p��

clear
format compact

sysP = tf([4 8],[1 2 -15 0])    % �`�B�֐� P(s) ���֐� tf �ɂ���`
pole(sysP)                      % �`�B�֐� P(s) �̋�
zero(sysP)                      % �`�B�֐� P(s) �̗�_
[z p K] = zpkdata(sysP,'v')     % �`�B�֐� P(s) �̗�_�C�ɁC�Q�C��
