% exercise_06_11_03a.m
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

% ======================================================
% �c���C�����̃��x���̕ύX

options = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ
    
options.Xlabel.String = '�p���g��';            % �����̃��x��
options.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��

figure(2)
bode(sysP,options)
grid on

% ======================================================
% �c���C�����̃��x���̕ύX
% �����͈̔͂̕ύX
% �c���͈̔͂̕ύX

options = bodeoptions;            % �{�[�h���}�̃I�v�V�����ꗗ
    
options.Xlabel.String = '�p���g��';            % �����̃��x��
options.Ylabel.String = {'�Q�C��'  '�ʑ�'};    % �c���̃��x��
options.XLim    = [1e-2 1e2];     % �����͈̔�
options.YLim{1} = [-160 20];      % �c���͈̔́i�Q�C�����}�j
options.YLim{2} = [-360 0];       % �c���͈̔́i�ʑ����}�j

figure(3)
bode(sysP,options)
grid on

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
