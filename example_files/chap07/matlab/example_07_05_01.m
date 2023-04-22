% example_07_05_01.m
% �� 7.5�F�{�[�h���}�ƈ���]�T�i�} 7.16�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.5 ')
disp('==================================================')

s = tf('s');
sysP = 1/(s + 1)^3;

% -----------------------------------
num = 0;
for kP = [2 8 20]
    num = num + 1;

    figure(num)
    sysL = minreal(sysP*kP);

    margin(sysL);
end

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
