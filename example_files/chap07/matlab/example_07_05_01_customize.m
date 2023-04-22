% example_07_05_01_customize.m
% �� 7.5�F�{�[�h���}�ƈ���]�T�i�} 7.16�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.5 ')
disp('==================================================')

s = tf('s');
sysP = 1/(s + 1)^3;

v = ver('MATLAB');
if v.Release < "(R2021a)"
    disp('****************************')
    disp('R2021a �ȍ~�œ��삵�܂�')
    disp('****************************')
else
    % -----------------------------------
    options = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ
    
    options.Xlabel.String = '�p���g��';            % �����̃��x��
    options.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��
    
    options.Title.FontSize     = 12;  % �^�C�g���̃t�H���g�T�C�Y
    options.Xlabel.FontSize    = 14;  % �����̃��x���̃t�H���g�T�C�Y
    options.YLabel.FontSize    = 14;  % �c���̃��x���̃t�H���g�T�C�Y
    options.TickLabel.FontSize = 12;  % ���̃t�H���g�T�C�Y
    
    options.XLim    = [1e-1 1e1];     % �����͈̔�
    options.YLim{1} = [-40 40];       % �c���͈̔́i�Q�C�����}�j
    options.YLim{2} = [-270 0];       % �c���͈̔́i�ʑ����}�j
    
    % -----------------------------------
    for num = 1:3
        figure(num)
        subplot('Position',[0.15 0.15 0.775 0.775])
    end
    
    % -----------------------------------
    num = 0;
    for kP = [2 8 20]
        num = num + 1;
    
        figure(num)
        sysL = minreal(sysP*kP);
    
        margin(sysL,options);
    end
    
    % -----------------------------------
    for num = 1:3
        figure(num)
        h = findobj(gcf,'type','Line');   % Line �Ƃ������O�̃I�u�W�F�N�g������
        set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX
    end
    
    % -----------------------------------
    figure(1); movegui('northwest')
    figure(2); movegui('north')
    figure(3); movegui('northeast')
end