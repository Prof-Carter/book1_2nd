% exercise_04_07_plot.m
% ��� 4.7�F���ʒu�΍�

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 4.7')
disp('==================================================')

s = tf('s');

t = 0:0.001:10;

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ����Ώ� P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP = 5/(s^2 + 2*s + 2);

for i = 1:3
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' �R���g���[�� C(s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    if i == 1
        kP = 2;
        sysC = kP

    elseif i == 2
        kP = 5;
        sysC = kP

    elseif i == 3    
        kP = 2;
        kI = 1.25;       
        sysC = (kP*s + kI)/s
    end
    
    disp(' ')
    disp('--------------------------------------------------')
    disp(' Gyr(s) = P(s)*C(s)/(1 + P(s)*C(s))')
    disp('--------------------------------------------------')
    
    sysL   = minreal(sysP*sysC);
    sysGyr = minreal(sysL/(1 + sysL))
    
    % ----- �O���t�̕`�� --------------------------------
    y = step(sysGyr,t);

    figure(1)
    plot(t,y)
    hold on
end

figure(1)
hold off

xlabel('t [s]')
ylabel('y(t)')

grid on

legend('C(s) = 2','C(s) = 5','C(s) = (2s + 1.25)/s')

movegui('north')

