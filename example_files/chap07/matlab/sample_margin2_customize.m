% sample_margin2_customize.m
% �{�[�h���}�ƈ���]�T

close all
clear
format compact

sysP = tf([1],[1 1])^3;
sysC = 2;
sysL = sysP*sysC;

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
    
    % -----------------------------------
    figure(1)
    subplot('Position',[0.15 0.15 0.775 0.775])
    
    margin(sysL,options)
    
    h = findobj(gcf,'type','Line');   % Line �Ƃ������O�̃I�u�W�F�N�g������
    set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX
end

