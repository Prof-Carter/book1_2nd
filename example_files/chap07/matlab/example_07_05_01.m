% example_07_05_01.m
% 例 7.5：ボード線図と安定余裕（図 7.16）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.5 ')
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
