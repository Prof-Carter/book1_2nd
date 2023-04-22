% example_07_01a_customize.m
% �� 7.1�F�i�C�L�X�g�̈��蔻�ʖ@�i�} 7.4�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.1 ')
disp('==================================================')

% -----------------------------------
options = nyquistoptions;           % �i�C�L�X�g�O�Ղ̃I�v�V�����ꗗ

options.Title.FontSize     = 16;    % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;    % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;    % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;    % ���̃t�H���g�T�C�Y

options.XLim = [-2 0.5];            % �����͈̔�
options.YLim = [-1 1];              % �c���͈̔�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s - 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s - 1)

% ------------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % �O���t�̕`��ʒu�̐ݒ�

for kP = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' C(s) = kP ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysC = kP
    
    disp(' ')
    disp('--------------------------------------------------')
    disp(' =====> L(s) = P(s)C(s)')
    disp('--------------------------------------------------')
    
    sysL = sysP*sysC

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

h = findobj(gcf,'type','Line');     % Line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)

[~, hobj, ~, ~] = legend({'kP = 0.5','kP = 1','kP = 2'}, ...
                          'FontSize',14,'FontName','Arial');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)             % legend ���̐��𑾂�


