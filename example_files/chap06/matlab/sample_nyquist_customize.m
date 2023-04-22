% sample_nyquist_customize.m
% �i�C�L�X�g�O�Ձi�} 6.15�C�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

sysP = tf([1],[1 0.5 1]);

% -----------------------
options = nyquistoptions;           % �i�C�L�X�g�O�Ղ̃I�v�V�����ꗗ

options.Title.FontSize     = 16;    % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;    % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;    % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;    % ���̃t�H���g�T�C�Y

options.XLim = [-1 1.5];            % �����͈̔�
options.YLim = [-2.5 2.5];          % �c���͈̔�

% -----------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % �O���t�̕`��ʒu�̐ݒ�
nyquist(sysP,options)               % �i�C�L�X�g�O�Ղ̕`��

set(gca,'XTick',-1:0.5:1.5)         % �����̖ڐ���
set(gca,'YTick',-2.5:0.5:2.5)       % �c���̖ڐ���

% -----------------------------------
h = findobj(gcf,'type','Line');     % line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)              % ���̑����� 1.5 �|�C���g�ɕύX

% -----------------------------------
hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

