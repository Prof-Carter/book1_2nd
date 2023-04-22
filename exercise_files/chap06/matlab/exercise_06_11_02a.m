% exercise_06_11_02a.m
% ��� 6.11�F��� 6.4 (2) �̃{�[�h���}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.11�F��� 6.4 (2) �̃{�[�h���}')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = s*(s + 1)/(10*(10*s + 1))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = s*(s + 1)/(10*(10*s + 1))

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

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')