% A3_03_save_graph3.m
% �t�^ A.3
% �O���t�̕ۑ� (3)�Fexportgraphics �𗘗p�iR2020a �ȍ~�j
% �@�@JPEG �t�@�C���CPNG �t�@�C���C
% �@�@PDF �t�@�C���C�g�����^�t�@�C���CEPS �t�@�C��

clc
close all
clear
format compact

disp(' ')
disp('=============================================================')
disp(' �� �O���t�̕ۑ� (3) ')
disp('=============================================================')

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> x = -5:0.1:5;')
disp('+  >> y = x.^2 - 2*x - 5;')
disp('+  >> figure(2)')
disp("+  >> plot(x,y,'r--','LineWidth',2)")
disp("+  >> set(gca,'FontSize',16,'FontName','Arial')")
disp("+  >> xlim([-4 4]); set(gca,'XTick',-4:1:4)")
disp("+  >> ylim([-10 20]); set(gca,'YTick',-10:5:20)")
disp("+  >> xlabel('x','FontSize',18,'FontName','Arial')")
disp("+  >> ylabel('y','FontSize',18,'FontName','Arial')")
disp('+  >> grid on')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

x = -5:0.1:5;
y = x.^2 - 2*x - 5;
figure(2)
plot(x,y,'r--','LineWidth',2)
set(gca,'FontSize',16,'FontName','Arial')
xlim([-4 4]); set(gca,'XTick',-4:1:4)
ylim([-10 20]); set(gca,'YTick',-10:5:20)
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
grid on

disp(' ')
disp('=============================================================')
disp('exportgraphics �� R2020a �ȍ~�œ��삵�܂�')
disp('=============================================================')

v = ver('MATLAB')

if v.Release < "(R2020a)"
    disp(' ')
    disp('***********************************************')
    disp('�g�p���Ă���o�[�W������ R2020a �ȍ~�ł͂���܂���')
    disp('***********************************************')
else
    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ JPEG �t�@�C��')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.jpg'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.jpg')
    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ PNG �t�@�C��')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.png'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.png')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ PDF �t�@�C��')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.pdf'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.pdf')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ �g�����^�t�@�C�� (Windows �̂�)')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.emf'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.emf')

    disp(' ')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('+ �J���[ EPS �t�@�C��')
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp("+  >> figure(2); exportgraphics(gcf,'graph2.eps'))")
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    figure(2); exportgraphics(gcf,'graph2.eps')
end

