% eoc02_02_tf2.m
% �֐� tf �̎g�p�� 2

clear
format compact

s = tf('s');                            % ���v���X���Z�q s �̒�`
sysP = (4*s + 8)/(s^3 + 2*s^2 - 15*s)   % �`�B�֐� P(s) �̒�`
