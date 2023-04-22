% exercise_06_04_02_customize.m
% ��� 6.4 (2)�F�x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.4 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = exp(-L*s)/(T*s + 1)')
disp(' �@�@�@�@    L = 1, T = 0.2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

L = 1
T = 0.2

sysP = exp(-L*s)/(T*s + 1)

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------
options = nyquistoptions;          % �i�C�L�X�g�O�Ղ̃I�v�V�����ꗗ

options.Title.FontSize     = 16;   % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;   % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;   % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;   % ���̃t�H���g�T�C�Y

options.XLim = [-1.2 1.2];         % �����͈̔�
options.YLim = [-1.2 1.2];         % �c���͈̔�

options.ShowFullContour = 'off';       % ���̊p���g���ɑ΂���O�Ղ�`�悵�Ȃ�
options.Title.String = '�x�N�g���O��';  % �^�C�g�����u�x�N�g���O�Ձv�ɕύX

% -----------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) % �O���t�̕`��ʒu�̐ݒ�

w = logspace(-2,2,10000);

nyquist(sysP,w,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off



