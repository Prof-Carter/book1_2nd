% example_07_03a_customize_tex.m
% �� 7.3�F�ȗ������ꂽ�i�C�L�X�g�̈��蔻�ʖ@�̗��p�� (2)�i�} 7.8�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.3 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^3 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)^3

% ------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

options.Title.FontSize     = 16;    % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;    % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;    % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;    % ���̃t�H���g�T�C�Y

% ------------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

w = logspace(-3,2,1000);

for kP = [4 8 16]
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

    nyquist(sysL,w,options)
    hold on
end

figure(1)
hold off

xlim([-4 16])
set(gca,'XTick',-4:2:16)
ylim([-12 2])
set(gca,'YTick',-12:2:2)

h = findobj(gcf,'type','Line');     % Line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)

[~, hobj, ~, ~] = legend({'$k\sb{\rm P} = 4$','$k\sb{\rm P} = 8$','$k\sb{\rm P} = 16$'}, ...
                          'Interpreter','latex','FontSize',16);
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)             % legend ���̐��𑾂�
