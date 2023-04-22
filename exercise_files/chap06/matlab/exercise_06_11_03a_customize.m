% exercise_06_11_03a_customize.m
% ��� 6.11�F��� 6.4 (3) �̃{�[�h���}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.11�F��� 6.4 (3) �̃{�[�h���}')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)^4

% ======================================================
% �W���̐ݒ�

figure(1)
bode(sysP)
grid on

% ------------------------------------------------------
options = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ

options.Xlabel.String = '�p���g��';            % �����̃��x��
options.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��

options.Title.FontSize     = 16;  % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;  % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;  % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;  % ���̃t�H���g�T�C�Y

options.Grid    = 'on';           % �⏕���̕\��

options.XLim    = [1e-2 1e2];     % �����͈̔�
options.YLim{1} = [-170 10];      % �c���͈̔́i�Q�C�����}�j
options.YLim{2} = [-380 20];      % �c���͈̔́i�ʑ����}�j

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % �O���t�̕`��ʒu�̐ݒ�

bode(sysP,options)
grid on

h = findobj(gcf,'type','Line');   % line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX

h = get(gca,'children');
set(h(1),'YTick',[1 2 3])

set(h(2),'YTick',[1 2 3])

