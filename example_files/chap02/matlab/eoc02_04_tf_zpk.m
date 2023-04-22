% eoc02_04_tf_zpk.m
% �֐� tf, zpk �Œ�`���ꂽ���f���̕ϊ�

clear
format compact

sysP1 = tf([4 8],[1 2 -15 0])   % �`�B�֐� P1(s) ���֐� tf �ɂ���`
sysP2 = zpk(sysP1)              % �֐� tf �Œ�`�����`�B�֐� P1(s) ���֐� zpk �ł̕\���ɕϊ�
sysP3 = tf(sysP2)               % �֐� zpk �Œ�`�����`�B�֐� P2(s) ���֐� tf �ł̕\���ɕϊ�