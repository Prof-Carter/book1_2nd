% sample_bode_customize.m
% �{�[�h���}�i�} 6.17�C�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1])

% -----------------------------------
options = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ

options.Xlabel.String = '�p���g��';            % �����̃��x��
options.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��

options.Title.FontSize     = 16;  % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;  % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;  % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;  % ���̃t�H���g�T�C�Y

options.Grid    = 'on';           % �⏕���̕\��

options.XLim    = [1e-1 1e1];     % �����͈̔�
options.YLim{1} = [-40 10];       % �c���͈̔́i�Q�C�����}�j
options.YLim{2} = [-180 0];       % �c���͈̔́i�ʑ����}�j

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % �O���t�̕`��ʒu�̐ݒ�

bode(sysP,options);               % �{�[�h���}�̕`��

% -----------------------------------
h = findobj(gcf,'type','Line');   % line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX
