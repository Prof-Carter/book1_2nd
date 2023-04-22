% A3_03_save_3d_graph6.m
% �t�^ A.3
% �O���t�̕ۑ� (6)�Fprint �𗘗p�i���X�^�`���ƃx�N�^�`���j
% �@�@PDF �t�@�C���C�g�����^�t�@�C���CEPS �t�@�C��

clc
close all
clear
format compact

disp(' ')
disp('================================================================')
disp(' �� �O���t�̕ۑ� (6) ')
disp('================================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> [X,Y] = meshgrid(1:0.5:10,1:20);')
disp('+  >> Z = sin(X) + cos(Y);')
disp('+  >> figure(1)')
disp('+  >> surf(X,Y,Z)')
disp("+  >> set(gca,'FontSize',16,'FontName','Arial')")
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

[X,Y] = meshgrid(1:0.5:10,1:20);
Z = sin(X) + cos(Y);
 
figure(1)
surf(X,Y,Z)
set(gca,'FontSize',16,'FontName','Arial')
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
zlabel('z','FontSize',18,'FontName','Arial')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �W���� PDF �t�@�C�� (���G�ȃO���t�Ȃ̂Ń��X�^�`���ƂȂ�)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-dpdf')")
disp('+  >> % print -dpdf 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-dpdf')
% print -dpdf 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �x�N�^�`���� PDF �t�@�C��')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph2','-painters','-dpdf')")
disp("+  >> % print('3d_graph2','-vector','-dpdf')")
disp('+  >> % print -dpdf -painters 3d_graph2')
disp('+  >> % print -dpdf -vector 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph2','-painters','-dpdf')
% print('3d_graph2','-vector','-dpdf')     % R2021b �ȍ~�� -vector �𐄏�
% print -dpdf -painters 3d_graph2
% print -dpdf -vector 3d_graph2            % R2021b �ȍ~�� -vector �𐄏�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �W���̊g�����^�t�@�C�� (���G�ȃO���t�Ȃ̂Ń��X�^�`���ƂȂ�)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-dmeta')")
disp('+  >> % print -dmeta 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-dmeta')
% print -dmeta 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �x�N�^�`���̊g�����^�t�@�C��')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph2','-painters','-dmeta')")
disp("+  >> % print('3d_graph2','-vector','-dmeta')")
disp('+  >> % print -dmeta -painters 3d_graph2')
disp('+  >> % print -dmeta -vector 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph2','-painters','-dmeta')
% print('3d_graph2','-vector','-dmeta')    % R2021b �ȍ~�� -vector �𐄏�
% print -dmeta -painters 3d_graph2
% print -dmeta -vector 3d_graph2           % R2021b �ȍ~�� -vector �𐄏�
