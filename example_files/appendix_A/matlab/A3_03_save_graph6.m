% A3_03_save_3d_graph6.m
% 付録 A.3
% グラフの保存 (6)：print を利用（ラスタ形式とベクタ形式）
% 　　PDF ファイル，拡張メタファイル，EPS ファイル

clc
close all
clear
format compact

disp(' ')
disp('================================================================')
disp(' ■ グラフの保存 (6) ')
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
disp('+ 標準の PDF ファイル (複雑なグラフなのでラスタ形式となる)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-dpdf')")
disp('+  >> % print -dpdf 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-dpdf')
% print -dpdf 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ベクタ形式の PDF ファイル')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph2','-painters','-dpdf')")
disp("+  >> % print('3d_graph2','-vector','-dpdf')")
disp('+  >> % print -dpdf -painters 3d_graph2')
disp('+  >> % print -dpdf -vector 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph2','-painters','-dpdf')
% print('3d_graph2','-vector','-dpdf')     % R2021b 以降は -vector を推奨
% print -dpdf -painters 3d_graph2
% print -dpdf -vector 3d_graph2            % R2021b 以降は -vector を推奨

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 標準の拡張メタファイル (複雑なグラフなのでラスタ形式となる)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph1','-dmeta')")
disp('+  >> % print -dmeta 3d_graph1')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph1','-dmeta')
% print -dmeta 3d_graph1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ベクタ形式の拡張メタファイル')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> print('3d_graph2','-painters','-dmeta')")
disp("+  >> % print('3d_graph2','-vector','-dmeta')")
disp('+  >> % print -dmeta -painters 3d_graph2')
disp('+  >> % print -dmeta -vector 3d_graph2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

print('3d_graph2','-painters','-dmeta')
% print('3d_graph2','-vector','-dmeta')    % R2021b 以降は -vector を推奨
% print -dmeta -painters 3d_graph2
% print -dmeta -vector 3d_graph2           % R2021b 以降は -vector を推奨
