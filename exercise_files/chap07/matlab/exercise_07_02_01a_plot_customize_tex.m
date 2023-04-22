% exercise_07_02_01a_plot_customize_tex.m
% ��� 7.2 (1)�F�J���[�v�`�B�֐��̃x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 7.2 (1)�F�ȗ������ꂽ�i�C�L�X�g�̈��蔻�ʖ@ ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �@�@�@�@�@�@�@�@�@                1        ')
disp(' ����Ώۂ̓`�B�֐� P(s) = -----------------')
disp(' �@�@�@�@�@�@�@�@�@        (s + 1)^2 (s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/((s + 1)^2*(s + 2))

% -----------------------------------
for i = 1:2
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -----------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;

% -----------------------------------
w = logspace(-3,2,1000);

num = 0;
for kP = 14:4:22
    num = num + 1;
    
    sysC = kP
    sysL = sysP*sysC
    
    for i = 1:2
        figure(i)
        nyquist(sysL,w,options)

        hold on
    end
end

for i = 1:2
    figure(i)
    plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
    hold off

    h = findobj(gcf,'type','Line');
    set(h,'LineWidth',1.5)

    set(gca,'FontName','Arial')
end

% -----------------------------------
figure(1)
[~, hobj, ~, ~] = legend({'$k\sb{\rm P} = 14$','$k\sb{\rm P} = 18$','$k\sb{\rm P} = 22$'}, ...
                          'Interpreter','latex','FontSize',16, ...
                          'Location','northeast');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)     % legend �̒��̐��𑾂�

xlim([-4 12])
ylim([-8 4])
set(gca,'XTick',-4:2:12)
set(gca,'YTick',-8:2:4)

% -----------------------------------
figure(2)
[~, hobj, ~, ~] = legend({'$k\sb{\rm P} = 14$','$k\sb{\rm P} = 18$','$k\sb{\rm P} = 22$'}, ...
                          'Interpreter','latex','FontSize',16, ...
                          'Location','southeast');
hh = findobj(hobj,'type','Line');
set(hh,'LineWidth',1.5)     % legend �̒��̐��𑾂�

xlim([-3 0.5])
ylim([-3 0.5])
set(gca,'XTick',-3:0.5:0.5)
set(gca,'YTick',-3:0.5:0.5)

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

