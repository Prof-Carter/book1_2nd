% A3_04_excel_text.m
% 付録 A.3

clc
close all
clear
format compact

disp(' ')
disp('===========================================================')
disp(' ■ データ列の Excel ファイルやテキストファイルへの保存と読み込み ')
disp('===========================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> x = -5:0.1:5;')
disp('+  >> y = x.^2 - 2*x - 5;')
disp("+  >> wdata = [x; y]';")
disp("+  >> writematrix(wdata,'data_file1.xlsx')")
disp("+  >> writematrix(wdata,'data_file2.txt')")
disp('++++++++++++++++++++++++++++++++++++++++++++++')

x = -5:0.1:5;
y = x.^2 - 2*x - 5;
wdata = [x; y]';

writematrix(wdata,'data_file1.xlsx')
writematrix(wdata,'data_file2.txt')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> rdata1 = readmatrix('data_file1.xlsx');")
disp("+  >> rdata2 = readmatrix('data_file2.txt');")
disp('+  >> figure(1); plot(rdata1(:,1),rdata1(:,2))')
disp('+  >> figure(2); plot(rdata2(:,1),rdata2(:,2))')
disp('++++++++++++++++++++++++++++++++++++++++++++++')

rdata1 = readmatrix('data_file1.xlsx');
rdata2 = readmatrix('data_file2.txt');

figure(1); plot(rdata1(:,1),rdata1(:,2))
figure(2); plot(rdata2(:,1),rdata2(:,2))

figure(1); movegui('northwest')
figure(2); movegui('northeast')

