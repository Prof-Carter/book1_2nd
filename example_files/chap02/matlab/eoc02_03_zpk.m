% eoc02_03_zpk.m
% �֐� zpk �̎g�p��

clear
format compact

z = [-2]; p = [-5 0 3];     % ��_�C�ɂ̒�`  
K = 4;                      % �Q�C���̒�`
sysP = zpk(z,p,K)           % ��_�E�ɁE�Q�C���`���̓`�B�֐� P(s)
