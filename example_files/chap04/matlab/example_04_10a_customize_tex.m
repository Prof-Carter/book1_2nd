% example_04_10a_customize_tex.m
% �� 4.10�F���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 4.10 ')
disp('==================================================')

s = tf('s');
sysP  = 1/((s + 1)*(s + 4)*(s + 7));
sysCd = 1;

sysPCd = sysP*sysCd;

% =====================================================
% ���O��
% =====================================================

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
h = rlocusplot(sysPCd);

h2 = findobj(gcf,'type','Line');
n = length(h2);
for i = 1:n
    h2(i).MarkerSize = 10;
end

set(h2,'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14);
set(gca,'XColor',[0 0 0],'YColor',[0 0 0])

p = getoptions(h);
p.Title.FontSize = 16;
p.XLabel.FontSize = 16;
p.YLabel.FontSize = 16;

setoptions(h,p)

xlim([-25 5])
ylim([-15 15])
set(gca,'XTick',-25:5:5)
set(gca,'YTick',-15:5:15)
xtickangle(0)

% ---------------
% �Â��o�[�W�����p�iR2018a �Ȃǁj
axis_x = findall(gcf,'String','���� (seconds^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (seconds^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');

% �ŋ߂̃o�[�W�����p
axis_x = findall(gcf,'String','���� (�b^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (�b^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');

% =====================================================
% �P�ʃX�e�b�v����
% =====================================================

t = 0:0.001:2.5;

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

for kP = [150 300 440]
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    sysGyr = minreal(sysL/(1 + sysL));
    
    y = step(sysGyr,t);
    
    plot(t,y,'LineWidth',1.5)
    hold on
end

figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$ [deg]','Interpreter','latex','FontSize',16)
title('�P�ʃX�e�b�v����','FontName','MS Gothic','FontSize',16)

legend({'${k}_{\rm P} = 150$','${k}_{\rm P} = 300$','${k}_{\rm P} = 440$'}, ...
        'Interpreter','latex','FontSize',16)
grid on

xlim([0 2.5])
ylim([0 2])
set(gca,'XTick',0:0.5:2.5)
set(gca,'YTick',0:0.5:2)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

    