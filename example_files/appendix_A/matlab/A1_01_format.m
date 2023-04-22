% A1_01_format.m
% 付録 A.1

clc
clear
format loose

disp(' ')
disp('=========================================')
disp(' ■ コマンドウィンドウと表示形式 ')
disp('=========================================')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> 2*3 - (4 + 5)/6')
disp('++++++++++++++++++++++++++++++')

2*3 - (4 + 5)/6

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

pi

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> format compact')
disp('+  >> format short e')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

format compact
format short e
pi

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> format short')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

format short
pi

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> format long')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

format long
pi

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> format long e')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

format compact
format long e
pi

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> format loose')
disp('+  >> format short')
disp('+  >> pi')
disp('++++++++++++++++++++++++++++++')

format loose
format short
pi
