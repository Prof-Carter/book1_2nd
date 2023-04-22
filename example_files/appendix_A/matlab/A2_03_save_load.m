% A2_03_save_load.m
% 付録 A.2

clc
clear
format compact

disp(' ')
disp('===================================================')
disp(' ■ ワークスペース変数の mat ファイルへの保存と読み込み ')
disp('===================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp('+  >> a = 5;')
disp('+  >> b = 2 + 3j;')
disp('+  >> A = [1 2 3; 4 5 6];')
disp('++++++++++++++++++++++++++++++')

a = 5;
b = 2 + 3j;
A = [1 2 3; 4 5 6];

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp("+  >> save('data1')")
disp("+  >> % save('data1.mat')")
disp('+  >> % save data1')
disp('+  >> % save data1.mat')
disp('++++++++++++++++++++++++++++++')

save('data1')
% save('data1.mat')
% save data1
% save data1.mat

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp("+  >> save('data2','a','b')")
disp("+  >> % save('data2.mat','a','b')")
disp("+  >> % save data2 a b")
disp("+  >> % save data2.mat a b")
disp('++++++++++++++++++++++++++++++')

save('data2','a','b') 
% save('data2.mat','a','b') 
% save data2 a b
% save data2.mat a b

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp("+  >> clear")
disp("+  >> load('data1')")
disp("+  >> % load('data1.mat')")
disp("+  >> % load data1")
disp("+  >> % load data1.mat")
disp("+  >> who")
disp('++++++++++++++++++++++++++++++')

clear
load('data1')
% load('data1.mat')
% load data1
% load data1.mat
who

disp(' ')
disp('++++++++++++++++++++++++++++++')
disp("+  >> clear")
disp("+  >> load('data1','a','b')")
disp("+  >> % load('data1.mat','a','b')")
disp("+  >> % load data1 a b")
disp("+  >> % load data1.mat a b")
disp("+  >> who")
disp('++++++++++++++++++++++++++++++')

clear
load('data1','a','b')
% load('data1.mat','a','b')
% load data1 a b
% load data1.mat a b
who

