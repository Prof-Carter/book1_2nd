% example_07_02a_customize.m
% �� 7.2�F�ȗ������ꂽ�i�C�L�X�g�̈��蔻�ʖ@�̗��p�� (1)�i�} 7.7�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.2 ')
disp('==================================================')

Ts = tf('s');
sysP = 1/(1 + Ts);

% ------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

options.Title.FontSize     = 16;    % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;    % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;    % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;    % ���̃t�H���g�T�C�Y

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

for kP = [0.5 1 2]
    sysC = kP;
    sysL = sysP*sysC

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

xlim([-1.2 2.2])
set(gca,'XTick',-1:0.5:2)
ylim([-1.8 0.8])
set(gca,'YTick',-2:0.5:1)

h = findobj(gcf,'type','Line');     % Line �Ƃ������O�̃I�u�W�F�N�g������
set(hh,'LineWidth',1.5)             % legend ���̐��𑾂�

[~, hobj, ~, ~] = legend({'kP = 0.5','kP = 1','kP = 2'}, ...
                          'FontSize',14,'FontName','Arial');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)
