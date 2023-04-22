% sample_nyquist2_customize.m
% �x�N�g���O�Ձi�} 6.16�C�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

% -----------------------------------
options = nyquistoptions;          % �i�C�L�X�g�O�Ղ̃I�v�V�����ꗗ

options.Title.FontSize     = 16;   % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;   % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;   % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;   % ���̃t�H���g�T�C�Y

options.XLim = [-1 1.5];           % �����͈̔�
options.YLim = [-2.5 0.5];         % �c���͈̔�

options.ShowFullContour = 'off';       % ���̊p���g���ɑ΂���O�Ղ�`�悵�Ȃ�
options.Title.String = '�x�N�g���O��';  % �^�C�g�����u�x�N�g���O�Ձv�ɕύX

% -----------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])     % �O���t�̕`��ʒu�̐ݒ�
nyquist(sysP,options)           % �x�N�g���O�Ղ̕`��

set(gca,'XTick',-1:0.5:1.5)     % �����̖ڐ���
set(gca,'YTick',-2.5:0.5:0.5)   % �c���̖ڐ���

% -----------------------------------
h = findobj(gcf,'type','Line');       % Line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)                % ���̑����� 1.5 �|�C���g�ɕύX

% -----------------------------------
hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off
