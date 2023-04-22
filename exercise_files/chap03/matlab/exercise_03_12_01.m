% exercise_03_12_01.m
% ��� 3.12�F��� 3.4 (1) �̓`�B�֐��ɑ΂��鎞�ԉ���

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' ��� 3.12�@<===�@��� 3.4 (1)')
disp('==================================================')

sysP = 3/(s + 2)

y1 = impulse(sysP,t);
figure(1)
plot(t,y1)
title('�C���p���X����')

y2 = step(sysP,t);
figure(2)
plot(t,y2)
title('�P�ʃX�e�b�v����')

u  = t;
y3 = lsim(sysP,u,t);
figure(3)
plot(t,y3)
title('�P�ʃ����v����')

for i = 1:3
    figure(i)
    xlabel('t [s]')
    ylabel('y(t)')
    grid on
end

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


