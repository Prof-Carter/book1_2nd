% exercise_07_02_01a_plot.m
% ��� 7.2 (1)�F�J���[�v�`�B�֐��̃x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 7.2 (1)�F�ȗ������ꂽ�i�C�L�X�g�̈��蔻�ʖ@ ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �@�@�@�@�@�@�@�@�@                1        ')
disp(' ����Ώۂ̓`�B�֐� P(s) = -----------------')
disp(' �@�@�@�@�@�@�@�@�@        (s + 1)^2 (s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/((s + 1)^2*(s + 2))

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

w = logspace(-3,2,1000);

num = 0;
for kP = 14:4:22
    num = num + 1;
    
    sysC = kP
    sysL = sysP*sysC
    
    for i = 1:2
        figure(i)
        nyquist(sysL,w,options)

        hold on
    end
end

% -----------------------------------
figure(1)
hold off
legend('kP = 14','kP = 18','kP = 22')

xlim([-4 12])
ylim([-8 4])

% -----------------------------------
figure(2)
hold off
legend('kP = 14','kP = 18','kP = 22')

xlim([-3 1])
ylim([-3 1])

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

