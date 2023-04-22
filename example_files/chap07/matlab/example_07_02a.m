% example_07_02a.m
% �� 7.2�F�ȗ������ꂽ�i�C�L�X�g�̈��蔻�ʖ@�̗��p�� (1)�i�} 7.7�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.2 ')
disp('==================================================')

Ts = tf('s');
sysP = 1/(1 + Ts);

% ------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = '�x�N�g���O��';

% ------------------------------------------------------
figure(1)

for kP = [0.5 1 2]
    sysC = kP;    
    sysL = sysP*sysC;

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

xlim([-1.2 2.2])
set(gca,'XTick',-1:0.5:2)
ylim([-1.8 0.8])
set(gca,'YTick',-2:0.5:1)

legend('kP = 0.5','kP = 1','kP = 2')


