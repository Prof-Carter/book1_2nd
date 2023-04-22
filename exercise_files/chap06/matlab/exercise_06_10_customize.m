% exercise_06_10_customize.m
% ��� 6.10�F��� 6.4 (3) �̃i�C�L�X�g�O�Ղƃx�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.10 ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');

sysP = 1/(s + 1)^4

w = logspace(-3,3,10000);

%  ----- �`��̃I�v�V�����ݒ� -----------------------------

options = nyquistoptions;          % �i�C�L�X�g�O�Ղ̃I�v�V�����ꗗ

options.Title.FontSize     = 16;   % �^�C�g���̃t�H���g�T�C�Y
options.Xlabel.FontSize    = 16;   % �����̃��x���̃t�H���g�T�C�Y
options.YLabel.FontSize    = 16;   % �c���̃��x���̃t�H���g�T�C�Y
options.TickLabel.FontSize = 14;   % ���̃t�H���g�T�C�Y

%  ----- �i�C�L�X�g�O�Ղ̕`�� -----------------------------

options.XLim = [-1.2 1.2];         % �����͈̔�
options.YLim = [-1 1];             % �c���͈̔�

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775]) 
nyquist(sysP,w,options)

h = findobj(gcf,'type','Line');   % Line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)            % ���̑����� 1.5 �|�C���g�ɕύX

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------

options.ShowFullContour = 'off';       % ���̊p���g���ɑ΂���O�Ղ�`�悵�Ȃ�
options.Title.String = '�x�N�g���O��';  % �^�C�g�����u�x�N�g���O�Ձv�ɕύX

options.XLim = [-1.2 1.2];         % �����͈̔�
options.YLim = [-1.5 0.5];         % �c���͈̔�

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775]) 

nyquist(sysP,w,options)            % �x�N�g���O�Ղ̕`��

h = findobj(gcf,'type','Line');    % Line �Ƃ������O�̃I�u�W�F�N�g������
set(h,'LineWidth',1.5)             % ���̑����� 1.5 �|�C���g�ɕύX

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

% -------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

