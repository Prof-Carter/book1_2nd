% exercise_04_10.m
% ��� 4.10�FSimulink �𗘗p�����ڕW�l�����ƊO�������̕`��

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % �ڕW�l r(t) = rc = 1�C�O�� d(t) = dc = 0
sim('exercise_04_10_sim_fbk')       % Simulink ���f�� exercise_04_10_sim_fbk.slx �̎��s

figure(1)                           % Figure 1 ���w��
plot(t,y)                           % �ڕW�l���� y(t) ��`��
xlabel('t [s]'); ylabel('y(t)')     % �����̃��x���C�c���̃��x��
title('r(t) = 1, d(t) = 0')         % �^�C�g��

% ---------------------------------------
rc = 0;  dc = 1;                    % �ڕW�l r(t) = rc = 0�C�O�� d(t) = dc = 1
sim('exercise_04_10_sim_fbk')       % Simulink ���f�� exercise_04_10_sim_fbk.slx �̎��s

figure(2)                           % Figure 2 ���w��
plot(t,y)                           % �O������ y(t) ��`��
xlabel('t [s]'); ylabel('y(t)')     % �����̃��x���C�c���̃��x��
title('r(t) = 0, d(t) = 1')         % �^�C�g��

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
