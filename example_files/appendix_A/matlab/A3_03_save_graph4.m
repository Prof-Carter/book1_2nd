% A3_03_save_3d_graph4.m
% �t�^ A.3
% �O���t�̕ۑ� (4)�Fprint �𗘗p�i�𑜓x�̕ύX�j
% �@�@JPEG �t�@�C���CPNG �t�@�C��

clc
close all
clear
format compact

disp(' ')
disp('================================================================')
disp(' �� �O���t�̕ۑ� (4) ')
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
disp('+ �W���� JPEG �t�@�C���i�𑜓x�F150 dpi�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-djpeg')")
disp('+  >> % print -djpeg 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-djpeg')
% print -djpeg 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �𑜓x���w�肵�� JPEG �t�@�C���i�𑜓x�F600 dpi�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('-r600','3d_graph2','-djpeg')")
disp('+  >> % print -djpeg -r600 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('-r600','3d_graph2','-djpeg')
% print -djpeg -r600 3d_graph2


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �W���� PNG �t�@�C���i�𑜓x�F150 dpi�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-dpng')")
disp('+  >> % print -dpng 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-dpng')
% print -dpng 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �𑜓x���w�肵�� PNG �t�@�C���i�𑜓x�F600 dpi�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('-r600','3d_graph2','-dpng')")
disp('+  >> % print -dpng -r600 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('-r600','3d_graph2','-dpng')
% print -dpng -r600 3d_graph2


